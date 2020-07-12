import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/message/post_message_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("post_status_bloc_impl.dart");

final findAcctsRegex = RegExp(r"\B\@(([\w.@\-]+))");

abstract class PostStatusBloc extends PostMessageBloc
    implements IPostStatusBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatusRepository statusRepository;

  final String conversationRemoteId;
  final IStatus inReplyToStatus;
  String get inReplyToStatusRemoteId => inReplyToStatus?.remoteId;

  String idempotencyKey;

  PostStatusBloc({
    @required this.pleromaStatusService,
    @required this.statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    this.conversationRemoteId,
    this.inReplyToStatus,
    int maximumMediaAttachmentCount = 8,
    PleromaVisibility initialVisibility = PleromaVisibility.PUBLIC,
    List<IAccount> initialAccountsToMention = const [],
  }) : super(
            pleromaMediaAttachmentService: pleromaMediaAttachmentService,
            maximumMediaAttachmentCount: maximumMediaAttachmentCount) {
    visibilitySubject = BehaviorSubject.seeded(initialVisibility);
    nsfwSensitiveSubject = BehaviorSubject.seeded(false);

    addDisposable(streamSubscription:
        mediaAttachmentsBloc.mediaAttachmentBlocsStream.listen((_) {
      _regenerateIdempotencyKey();
    }));

    addDisposable(subject: selectedActionSubject);
    addDisposable(subject: mentionedAcctsSubject);
    addDisposable(subject: visibilitySubject);
    addDisposable(subject: scheduledAtSubject);

    var focusListener = () {
      onFocusChange(focusNode.hasFocus);
    };

    focusNode.addListener(focusListener);

    addDisposable(disposable: CustomDisposable(() {
      focusNode.removeListener(focusListener);
    }));

    if (initialAccountsToMention?.isNotEmpty == true) {
      initialAccountsToMention.forEach((account) {
        addMentionByAccount(account);
      });
    }
  }

  void onFocusChange(bool hasFocus) {
    // nothing by default
  }

  @override
  bool get isHaveMentionedAccts => mentionedAccts?.isNotEmpty == true;
  @override
  Stream<bool> get isHaveMentionedAcctsStream => mentionedAcctsStream
      .map((mentionedAccts) => mentionedAccts?.isNotEmpty == true);

  void _regenerateIdempotencyKey() {
    idempotencyKey = DateTime.now().millisecondsSinceEpoch.toString();
  }

  // ignore: close_sinks
  BehaviorSubject<List<String>> mentionedAcctsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<String> get mentionedAccts => mentionedAcctsSubject.value;

  @override
  Stream<List<String>> get mentionedAcctsStream => mentionedAcctsSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<DateTime> scheduledAtSubject = BehaviorSubject();

  @override
  bool get isScheduled => scheduledAt != null;

  @override
  Stream<bool> get isScheduledStream =>
      scheduledAtStream.map((scheduledAt) => scheduledAt != null);

  @override
  DateTime get scheduledAt => scheduledAtSubject.value;

  @override
  Stream<DateTime> get scheduledAtStream => scheduledAtSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<PleromaVisibility> visibilitySubject;

  @override
  PleromaVisibility get visibility => visibilitySubject.value;

  @override
  Stream<PleromaVisibility> get visibilityStream => visibilitySubject.stream;

  // ignore: close_sinks
  BehaviorSubject<bool> nsfwSensitiveSubject;

  @override
  bool get isNsfwSensitiveEnabled => nsfwSensitiveSubject.value;

  @override
  Stream<bool> get isNsfwSensitiveEnabledStream => nsfwSensitiveSubject.stream;

  @override
  bool get isReadyToPost => calculateIsReadyToPost(
      inputText: inputWithoutMentionedAcctsText,
      mediaAttachmentBlocs: mediaAttachmentsBloc.mediaAttachmentBlocs,
      isAllAttachedMediaUploaded:
          mediaAttachmentsBloc.isAllAttachedMediaUploaded);

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest3(
      inputWithoutMentionedAcctsTextStream,
      mediaAttachmentsBloc.mediaAttachmentBlocsStream,
      mediaAttachmentsBloc.isAllAttachedMediaUploadedStream,
      (inputWithoutMentionedAcctsText, mediaAttachmentBlocs,
              isAllAttachedMediaUploaded) =>
          calculateIsReadyToPost(
              inputText: inputWithoutMentionedAcctsText,
              mediaAttachmentBlocs: mediaAttachmentBlocs,
              isAllAttachedMediaUploaded: isAllAttachedMediaUploaded));

  @override
  String get inputWithoutMentionedAcctsText =>
      removeAcctsFromText(inputText, mentionedAccts);

  @override
  Stream<String> get inputWithoutMentionedAcctsTextStream => Rx.combineLatest2(
      inputTextStream,
      mentionedAcctsStream,
      (inputText, mentionedAccts) =>
          removeAcctsFromText(inputText, mentionedAccts));

  @override
  FocusNode focusNode = FocusNode();

  void onMentionedAccountsChanged() {
    var mentionedAccts = this.mentionedAccts;
    mentionedAcctsSubject.add(mentionedAccts);
    _logger.finest(() => "onMentionedAccountsChanged $mentionedAccts");
    var text = inputTextController.text;
    var textAccts = findAcctMentionsInText(text);

    var acctsToAdd =
        mentionedAccts.where((acct) => !textAccts.contains(acct)).toList();
    var acctsToRemove =
        textAccts.where((acct) => !mentionedAccts.contains(acct)).toList();
    if (acctsToAdd.isNotEmpty || acctsToRemove.isNotEmpty) {
      var newText = prependAccts(text, acctsToAdd);
      newText = removeAcctsFromText(newText, acctsToRemove);
      _logger.finest(() => "onMentionedAccountsChanged newText $newText");
      inputTextController.text = newText;
      inputTextSubject.add(newText);
    }
  }

  @override
  void onInputTextChanged() {
    super.onInputTextChanged();
    var text = inputTextController.text;

    if (inputText != text) {
      var textAccts = findAcctMentionsInText(text);

      var mentionedAccts = this.mentionedAccts;
      var acctsToAdd =
          textAccts.where((acct) => !mentionedAccts.contains(acct)).toList();
      var acctsToRemove =
          mentionedAccts.where((acct) => !textAccts.contains(acct)).toList();
      if (acctsToAdd.isNotEmpty || acctsToRemove.isNotEmpty) {
        _logger.finest(() => "onInputTextChanged \n"
            "\t acctsToAdd=$acctsToAdd"
            "\t acctsToRemove=$acctsToRemove");
        mentionedAccts.addAll(acctsToAdd);
        acctsToRemove.forEach((acct) => mentionedAccts.remove(acct));
        mentionedAcctsSubject.add(mentionedAccts);
      }
      _regenerateIdempotencyKey();
    }
  }

  static List<String> findAcctMentionsInText(String text) {
    var matches = findAcctsRegex.allMatches(text);

    return matches.map((match) => // group(0) is all match
        // group(1) is acct without first @
        match.group(1)).toList();
  }

  static String prependAccts(String text, List<String> accts) {
    if (accts.isNotEmpty) {
      var acctsString = accts.map((acct) => "@$acct").join(", ");

      return "$acctsString $text";
    } else {
      return text;
    }
  }

  @override
  void addMentionByAccount(IAccount account) {
    var acct = account.acct;
    if (!mentionedAccts.contains(acct)) {
      mentionedAccts.add(acct);
      onMentionedAccountsChanged();
    }
  }

  @override
  void removeMentionByAccount(IAccount account) {
    removeMentionByAcct(account.acct);
  }

  @override
  void removeMentionByAcct(String acct) {
    if (mentionedAccts.contains(acct)) {
      mentionedAccts.remove(acct);
      onMentionedAccountsChanged();
    }
  }

  @override
  void changeVisibility(PleromaVisibility visibility) {
    visibilitySubject.add(visibility);
  }

  @override
  void changeNsfwSensitive(bool nsfwSensitive) {
    nsfwSensitiveSubject.add(nsfwSensitive);
  }

  bool isMaximumAttachmentReached(
      {@required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
      @required int maximumMediaAttachmentCount}) {
    return mediaAttachmentBlocs.length >= maximumMediaAttachmentCount;
  }

  @override
  Future<bool> post() async {
    bool success;
    if (isScheduled) {
      success = await _scheduleStatus();
    } else {
      success = await _postStatus();
    }

    if (success) {
      clear();
    }
    return success;
  }

  Future<bool> _postStatus() async {
    var remoteStatus = await pleromaStatusService.postStatus(
        data: PleromaPostStatus(
      mediaIds: _calculateMediaIdsField(),
      status: calculateStatusTextField(),
      sensitive: isNsfwSensitiveEnabled,
      visibility: pleromaVisibilityValues.reverse[visibility],
      inReplyToId: inReplyToStatusRemoteId,
      inReplyToConversationId: conversationRemoteId,
      idempotencyKey: idempotencyKey,
      to: _calculateToField(),
    ));

    var success;
    if (remoteStatus != null) {
      await statusRepository.upsertRemoteStatus(remoteStatus,
          listRemoteId: null, conversationRemoteId: conversationRemoteId);
      await onStatusPosted(remoteStatus);
      if (inReplyToStatusRemoteId != null) {}
      success = true;
    } else {
      success = false;
    }
    if (success) {
      try {
        await statusRepository.incrementRepliesCount(
            remoteId: inReplyToStatusRemoteId);
      } catch (e, stackTrace) {
        _logger.warning(
            () => "failed to incrementRepliesCount $inReplyToStatusRemoteId",
            e,
            stackTrace);
      }
    }
    return success;
  }

  List<String> _calculateMediaIdsField() {
    var mediaIds = mediaAttachmentsBloc.mediaAttachmentBlocs
        ?.where(
            (bloc) => bloc.uploadState == UploadMediaAttachmentState.uploaded)
        ?.map((bloc) => bloc.pleromaMediaAttachment.id)
        ?.toList();
    // media ids shouldn't be empty (should be null in this case)
    if(mediaIds?.isNotEmpty != true) {
      mediaIds = null;
    }
    return mediaIds;
  }

  Future<bool> _scheduleStatus() async {
    var scheduledStatus = await pleromaStatusService.scheduleStatus(
        data: PleromaScheduleStatus(
      mediaIds: _calculateMediaIdsField(),
      status: calculateStatusTextField(),
      sensitive: isNsfwSensitiveEnabled,
      visibility: pleromaVisibilityValues.reverse[visibility],
      inReplyToId: inReplyToStatusRemoteId,
      inReplyToConversationId: conversationRemoteId,
      idempotencyKey: idempotencyKey,
      scheduledAt: scheduledAt,
      to: _calculateToField(),
    ));
    var success = scheduledStatus != null;
    return success;
  }

  @override
  void clear() {
    super.clear();
    focusNode.unfocus();
    nsfwSensitiveSubject.add(false);
    _regenerateIdempotencyKey();
    clearSchedule();
  }

  String removeAcctsFromText(String inputText, List<String> mentionedAccts) {
    var newText = inputText;
    // todo: better performance via Regex
    mentionedAccts?.forEach((acctToRemove) {
      newText = newText.replaceAll("@$acctToRemove, ", "");
      newText = newText.replaceAll("@$acctToRemove,", "");
      newText = newText.replaceAll(" @$acctToRemove ", "");
      newText = newText.replaceAll("@$acctToRemove", "");
    });

    return newText;
  }

  @override
  void schedule(DateTime dateTime) {
    scheduledAtSubject.add(dateTime);
  }

  @override
  void clearSchedule() {
    schedule(null);
  }

  @override
  void appendText(String textToAppend) {
    inputTextController.text = "${inputText ?? ""}$textToAppend";
  }

  Future onStatusPosted(IPleromaStatus remoteStatus) async {
    // nothing by default
  }

  @override
  PostStatusSelectedAction get selectedAction => selectedActionSubject.value;

  @override
  Stream<PostStatusSelectedAction> get selectedActionStream =>
      selectedActionSubject.stream;

  BehaviorSubject<PostStatusSelectedAction> selectedActionSubject =
      BehaviorSubject();

  @override
  bool get isAttachActionSelected =>
      selectedAction == PostStatusSelectedAction.attach;

  @override
  Stream<bool> get isAttachActionSelectedStream => selectedActionStream.map(
      (selectedAction) => selectedAction == PostStatusSelectedAction.attach);

  @override
  void toggleAttachActionSelection() {
    if (isAttachActionSelected) {
      selectedActionSubject.add(null);
    } else {
      selectedActionSubject.add(PostStatusSelectedAction.attach);
    }
  }

  List<String> _calculateToField() {
    if (pleromaStatusService.isPleromaInstance) {
      if (inReplyToStatus != null) {
        var inReplyToStatusAcct = inReplyToStatus.account.acct;

        var toField = [...mentionedAccts];

        if (!toField.contains(inReplyToStatusAcct)) {
          toField.add(inReplyToStatusAcct);
        }
        return toField;
      } else {
        return mentionedAccts;
      }
    } else {
      return null;
    }
  }

  String calculateStatusTextField() {
    if (pleromaStatusService.isPleromaInstance) {
      return inputText;
    } else {
      if (inReplyToStatus != null) {
        var inReplyToStatusAcct = inReplyToStatus.account.acct;

        return "@${inReplyToStatusAcct} $inputText";
      } else {
        return inputText;
      }
    }
  }
}
