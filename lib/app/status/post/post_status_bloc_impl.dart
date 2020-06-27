import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("post_status_bloc_impl.dart");

final findAcctsRegex = RegExp(r"\B\@(([\w.@\-]+))");

abstract class PostStatusBloc extends DisposableOwner
    implements IPostStatusBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatusRepository statusRepository;

  final String conversationRemoteId;
  final String inReplyToStatusRemoteId;

  @override
  final IUploadMediaAttachmentsCollectionBloc mediaAttachmentGridBloc;

  // ignore: close_sinks
  BehaviorSubject<String> inputTextSubject = BehaviorSubject.seeded("");

  String idempotencyKey;

  PostStatusBloc({
    @required this.pleromaStatusService,
    @required this.statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    this.conversationRemoteId,
    this.inReplyToStatusRemoteId,
    int maximumMediaAttachmentCount = 4,
    PleromaVisibility initialVisibility = PleromaVisibility.PUBLIC,
    List<IAccount> initialAccountsToMention = const [],
  }) : mediaAttachmentGridBloc = UploadMediaAttachmentsCollectionBloc(
            maximumMediaAttachmentCount: maximumMediaAttachmentCount,
            pleromaMediaAttachmentService: pleromaMediaAttachmentService) {
    assert(pleromaMediaAttachmentService != null);
    visibilitySubject = BehaviorSubject.seeded(initialVisibility);
    nsfwSensitiveSubject = BehaviorSubject.seeded(false);

    addDisposable(streamSubscription:
        mediaAttachmentGridBloc.mediaAttachmentBlocsStream.listen((_) {
      _regenerateIdempotencyKey();
    }));

    addDisposable(subject: selectedActionSubject);
    addDisposable(subject: mentionedAcctsSubject);
    addDisposable(subject: inputTextSubject);
    addDisposable(subject: visibilitySubject);
    addDisposable(subject: scheduledAtSubject);

    addDisposable(textEditingController: inputTextController);

    var editTextListener = () {
      onInputTextChanged();
    };
    inputTextController.addListener(editTextListener);

    addDisposable(disposable: CustomDisposable(() {
      inputTextController.removeListener(editTextListener);
    }));

    addDisposable(focusNode: focusNode);

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
      mediaAttachmentBlocs: mediaAttachmentGridBloc.mediaAttachmentBlocs);

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest2(
      inputWithoutMentionedAcctsTextStream,
      mediaAttachmentGridBloc.mediaAttachmentBlocsStream,
      (inputWithoutMentionedAcctsText, mediaAttachmentBlocs) =>
          calculateIsReadyToPost(
              inputText: inputWithoutMentionedAcctsText,
              mediaAttachmentBlocs: mediaAttachmentBlocs));

  @override
  String get inputText => inputTextSubject.value;

  @override
  Stream<String> get inputTextStream => inputTextSubject.stream;

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
  TextEditingController inputTextController = TextEditingController();
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

  void onInputTextChanged() {
    var text = inputTextController.text;

    if (inputText != text) {
      inputTextSubject.add(text);

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

//    matches.forEach((match) => {
//      _logger.finest(()=> "match \n "
//          "\t input = ${match.input}"
//          "\t groupCount = ${match.groupCount}"
//          "\t group(0) = ${match.group(0)}"
//          "\t group(1) = ${match.group(1)}"
//      )
//    });

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

  bool calculateIsReadyToPost(
      {@required String inputText,
      @required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs}) {
    var textIsNotEmpty = inputText?.trim()?.isEmpty != true;
    var mediaAttached = mediaAttachmentBlocs?.isEmpty != true;

    return textIsNotEmpty || mediaAttached;
  }

  @override
  Future<bool> postStatus() async {
    bool success;
    if (isScheduled) {
      success = await _scheduleStatus();
    } else {
      success = await _postStatus();
    }

    if (success) {
      _clear();
    }
    return success;
  }

  Future<bool> _postStatus() async {
    var remoteStatus = await pleromaStatusService.postStatus(
        data: PleromaPostStatus(
            mediaIds: mediaAttachmentGridBloc.mediaAttachmentBlocs
                ?.map((bloc) => bloc.pleromaMediaAttachment.id)
                ?.toList(),
            status: inputText,
            sensitive: isNsfwSensitiveEnabled,
            visibility: pleromaVisibilityValues.reverse[visibility],
            inReplyToId: inReplyToStatusRemoteId,
            inReplyToConversationId: conversationRemoteId,
            idempotencyKey: idempotencyKey));

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

  Future<bool> _scheduleStatus() async {
    var scheduledStatus = await pleromaStatusService.scheduleStatus(
        data: PleromaScheduleStatus(
            mediaIds: mediaAttachmentGridBloc.mediaAttachmentBlocs
                ?.map((bloc) => bloc.pleromaMediaAttachment.id)
                ?.toList(),
            status: inputText,
            sensitive: isNsfwSensitiveEnabled,
            visibility: pleromaVisibilityValues.reverse[visibility],
            inReplyToId: inReplyToStatusRemoteId,
            inReplyToConversationId: conversationRemoteId,
            idempotencyKey: idempotencyKey,
            scheduledAt: scheduledAt));
    var success = scheduledStatus != null;
    return success;
  }

  void _clear() {
    focusNode.unfocus();
    inputTextController.clear();
    mediaAttachmentGridBloc.clear();
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
  bool get isAttachFileActionSelected =>
      selectedAction == PostStatusSelectedAction.files;

  @override
  Stream<bool> get isAttachFileActionStream => selectedActionStream.map(
      (selectedAction) => selectedAction == PostStatusSelectedAction.files);

  @override
  bool get isAttachGalleryActionSelected =>
      selectedAction == PostStatusSelectedAction.gallery;

  @override
  Stream<bool> get isAttachGalleryActionSelectedStream =>
      selectedActionStream.map((selectedAction) =>
          selectedAction == PostStatusSelectedAction.gallery);

  @override
  void toggleAttachFileActionSelection() {
    if(isAttachFileActionSelected) {
      selectedActionSubject.add(null);
    } else {
      selectedActionSubject.add(PostStatusSelectedAction.files);

    }
  }

  @override
  void toggleAttachGalleryActionSelection() {
    if(isAttachGalleryActionSelected) {
      selectedActionSubject.add(null);
    } else {
      selectedActionSubject.add(PostStatusSelectedAction.gallery);

    }
  }
}
