import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/message/post_message_bloc_impl.dart';
import 'package:fedi/app/message/post_message_model.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc_impl.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("post_status_bloc_impl.dart");

final findAcctsRegex = RegExp(r"\B\@(([\w.@\-]+))");

abstract class PostStatusBloc extends PostMessageBloc
    implements IPostStatusBloc {
  @override
  bool get isAnyDataEntered {
    return inputText?.isNotEmpty == true ||
        subjectText?.isNotEmpty == true ||
        mediaAttachmentsBloc.mediaAttachmentBlocs.isNotEmpty ||
        pollBloc.isSomethingChanged;
  }

  final bool markMediaAsNsfwOnAttach;
  bool alreadyMarkMediaNsfwByDefault = false;
  final PleromaInstancePollLimits pleromaInstancePollLimits;

  PostStatusBloc({
    @required this.pleromaAuthStatusService,
    @required this.statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    int maximumMediaAttachmentCount = 8,
    @required int maximumMessageLength,
    @required IPostStatusData initialData,
    List<IAccount> initialAccountsToMention = const [],
    @required this.pleromaInstancePollLimits,
    @required int maximumFileSizeInBytes,
    @required this.markMediaAsNsfwOnAttach,
  }) : super(
          maximumMessageLength: maximumMessageLength,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
        ) {
    this.initialData = initialData ?? defaultInitData;
    visibilitySubject =
        BehaviorSubject.seeded(initialData.visibility.toPleromaVisibility());
    nsfwSensitiveSubject =
        BehaviorSubject.seeded(initialData.isNsfwSensitiveEnabled);


    pollBloc = PostStatusPollBloc(
      pollLimits: pleromaInstancePollLimits,
    );

    addDisposable(subject: selectedActionSubject);
    addDisposable(subject: mentionedAcctsSubject);
    addDisposable(subject: visibilitySubject);
    addDisposable(subject: scheduledAtSubject);

    addDisposable(disposable: pollBloc);

    var focusListener = () {
      onFocusChange(inputFocusNode.hasFocus);
    };

    inputFocusNode.addListener(focusListener);

    addDisposable(
      disposable: CustomDisposable(
        () async {
          inputFocusNode.removeListener(focusListener);
        },
      ),
    );

    addDisposable(focusNode: subjectFocusNode);
    addDisposable(textEditingController: subjectTextController);
    addDisposable(subject: subjectTextSubject);

    var editTextListener = () {
      onSubjectTextChanged();
    };
    subjectTextController.addListener(editTextListener);

    addDisposable(
      disposable: CustomDisposable(
        () async {
          subjectTextController.removeListener(editTextListener);
        },
      ),
    );

    if (initialAccountsToMention?.isNotEmpty == true) {
      initialAccountsToMention.forEach(
        (account) {
          mentionedAccts.add(account.acct);
        },
      );

      onMentionedAccountsChanged();
    }

    if (initialData.scheduledAt != null) {
      scheduledAtSubject.add(initialData.scheduledAt);
    }
    if (initialData.subject != null) {
      subjectTextController.text = initialData.subject;
    }
    if (initialData.text != null) {
      inputTextController.text = initialData.text;
    }
    if (initialData.poll != null) {
      pollBloc.fillFormData(initialData.poll);
    }
    if (initialData.mediaAttachments?.isNotEmpty == true) {
      initialData.mediaAttachments.forEach(
        (attachment) {
          mediaAttachmentsBloc.addUploadedAttachment(attachment);
        },
      );
    }
    if (markMediaAsNsfwOnAttach) {
      addDisposable(
        streamSubscription:
            mediaAttachmentsBloc.mediaAttachmentBlocsStream.listen(
          (blocs) {
            if (!alreadyMarkMediaNsfwByDefault && blocs.isNotEmpty) {
              alreadyMarkMediaNsfwByDefault = true;
              nsfwSensitiveSubject.add(true);
            }
          },
        ),
      );
    }

    addDisposable(
      streamSubscription: pollBloc.isSomethingChangedStream.listen(
        (_) {
          _checkPollEmptyInputError();
        },
      ),
    );

    addDisposable(
      streamSubscription: inputTextStream.listen(
        (_) {
          _checkPollEmptyInputError();
        },
      ),
    );
  }

  static const postMessagePollEmptyInputTextError =
      PostMessagePollEmptyInputTextError();

  void _checkPollEmptyInputError() {
    var isSomethingChangedPollBloc = pollBloc.isSomethingChanged;

    _logger.finest(() => "_checkPollEmptyInputError "
        "isSomethingChangedPollBloc $isSomethingChangedPollBloc");
    var currentInputTextErrors = inputTextErrors;
    if (isSomethingChangedPollBloc) {
      var textIsNotEmpty = inputText?.isNotEmpty == true;
      _logger.finest(() => "_checkPollEmptyInputError "
          "textIsNotEmpty $textIsNotEmpty");
      if (textIsNotEmpty) {
        currentInputTextErrors.remove(postMessagePollEmptyInputTextError);
        inputTextErrorsSubject.add([...currentInputTextErrors]);
      } else {
        if (!currentInputTextErrors
            .contains(postMessagePollEmptyInputTextError)) {
          currentInputTextErrors.add(postMessagePollEmptyInputTextError);
          inputTextErrorsSubject.add([...currentInputTextErrors]);
        }
        _logger.finest(() => "_checkPollEmptyInputError "
            "add inputTextErrors $currentInputTextErrors");
      }
    } else {
      currentInputTextErrors.remove(postMessagePollEmptyInputTextError);
      inputTextErrorsSubject.add([...currentInputTextErrors]);
    }
  }

  final IPleromaAuthStatusService pleromaAuthStatusService;
  final IStatusRepository statusRepository;

  @override
  IStatus get originInReplyToStatus =>
      mapRemoteStatusToLocalStatus(initialData.inReplyToPleromaStatus);

  String get inReplyToStatusRemoteId => originInReplyToStatus?.remoteId;

  @override
  IPostStatusPollBloc pollBloc;

  IPostStatusData initialData;

  static final defaultInitData = PostStatusData(
    subject: null,
    text: null,
    scheduledAt: null,
    visibility: PleromaVisibility.public.toJsonValue(),
    mediaAttachments: null,
    poll: null,
    inReplyToPleromaStatus: null,
    inReplyToConversationId: null,
    isNsfwSensitiveEnabled: false,
    to: null,
    language: null,
  );

  void onFocusChange(bool hasFocus) {
    // nothing by default
  }

  @override
  bool get isHaveMentionedAccts => mentionedAccts?.isNotEmpty == true;

  @override
  Stream<bool> get isHaveMentionedAcctsStream => mentionedAcctsStream
      .map((mentionedAccts) => mentionedAccts?.isNotEmpty == true);

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
  bool get isReadyToPost => calculateStatusBlocIsReadyToPost(
        inputText: inputWithoutMentionedAcctsText,
        mediaAttachmentBlocs: mediaAttachmentsBloc.mediaAttachmentBlocs,
        isAllAttachedMediaUploaded:
            mediaAttachmentsBloc.isAllAttachedMediaUploaded,
        isPollBlocHaveErrors: pollBloc.isHaveAtLeastOneError,
        isPollBlocChanged: pollBloc.isSomethingChanged,
      );

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest5(
        inputWithoutMentionedAcctsTextStream,
        mediaAttachmentsBloc.mediaAttachmentBlocsStream,
        mediaAttachmentsBloc.isAllAttachedMediaUploadedStream,
        pollBloc.isHaveAtLeastOneErrorStream,
        pollBloc.isSomethingChangedStream,
        (
          inputWithoutMentionedAcctsText,
          mediaAttachmentBlocs,
          isAllAttachedMediaUploaded,
          isHaveAtLeastOneError,
          isPollBlocChanged,
        ) =>
            calculateStatusBlocIsReadyToPost(
          inputText: inputWithoutMentionedAcctsText,
          mediaAttachmentBlocs: mediaAttachmentBlocs,
          isAllAttachedMediaUploaded: isAllAttachedMediaUploaded,
          isPollBlocHaveErrors: isHaveAtLeastOneError,
          isPollBlocChanged: isPollBlocChanged,
        ),
      );

  bool calculateStatusBlocIsReadyToPost({
    @required String inputText,
    @required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
    @required bool isAllAttachedMediaUploaded,
    @required bool isPollBlocHaveErrors,
    @required bool isPollBlocChanged,
  }) {
    var isReady = super.calculateIsReadyToPost(
      inputText: inputText,
      mediaAttachmentBlocs: mediaAttachmentBlocs,
      isAllAttachedMediaUploaded: isAllAttachedMediaUploaded,
    );

    return isReady && (!isPollBlocChanged || !isPollBlocHaveErrors);
  }

  @override
  String get inputWithoutMentionedAcctsText =>
      removeAcctsFromText(inputText, mentionedAccts);

  @override
  Stream<String> get inputWithoutMentionedAcctsTextStream => Rx.combineLatest2(
      inputTextStream,
      mentionedAcctsStream,
      (inputText, mentionedAccts) =>
          removeAcctsFromText(inputText, mentionedAccts));

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
    var oldInputText = inputText;
    super.onInputTextChanged();
    var text = inputTextController.text;

    if (oldInputText != text) {
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
  void addAccountMentions(List<IAccount> accounts) {
    var accts = accounts.map((account) => account.acct);

    // remove duplicates
    removeAccountMentions(accounts);
    mentionedAccts.addAll(accts);

    onMentionedAccountsChanged();
  }

  @override
  void removeAccountMentions(List<IAccount> accounts) {
    var accts = accounts.map((account) => account.acct);

    mentionedAccts.removeWhere((acct) => accts.contains(acct));

    onMentionedAccountsChanged();
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
    var postStatusData = calculateCurrentPostStatusData();

    return await internalPostStatusData(postStatusData);
  }

  Future<bool> internalPostStatusData(IPostStatusData postStatusData) async {
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
    var remoteStatus = await pleromaAuthStatusService.postStatus(
      data: PleromaPostStatus(
        mediaIds: _calculateMediaIdsField(),
        status: calculateStatusTextField(),
        sensitive: isNsfwSensitiveEnabled,
        visibility: calculateVisibilityField(),
        inReplyToId: calculateInReplyToStatusField()?.remoteId,
        inReplyToConversationId: initialData.inReplyToConversationId,
        idempotencyKey: idempotencyKey,
        to: calculateToField(),
        poll: _calculatePleromaPostStatusPollField(),
        spoilerText: _calculateSpoilerTextField(),
        language: initialData.language,
      ),
    );

    var success;
    if (remoteStatus != null) {
      await statusRepository.upsertRemoteStatus(remoteStatus,
          listRemoteId: null,
          conversationRemoteId: initialData.inReplyToConversationId);
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

  String calculateVisibilityField() => visibility.toJsonValue();

  List<String> _calculateMediaIdsField() => _calculateMediaAttachmentsField()
      ?.map((mediaAttachment) => mediaAttachment.id)
      ?.toList();

  List<IPleromaMediaAttachment> _calculateMediaAttachmentsField() {
    var mediaAttachments = mediaAttachmentsBloc.mediaAttachmentBlocs
        ?.where((bloc) =>
            bloc.uploadState.type == UploadMediaAttachmentStateType.uploaded)
        ?.map((bloc) => bloc.pleromaMediaAttachment)
        ?.toList();
    // media ids shouldn't be empty (should be null in this case)
    if (mediaAttachments?.isNotEmpty != true) {
      mediaAttachments = null;
    }
    return mediaAttachments;
  }

  Future<bool> _scheduleStatus() async {
    var scheduledStatus = await pleromaAuthStatusService.scheduleStatus(
        data: PleromaScheduleStatus(
      mediaIds: _calculateMediaIdsField(),
      status: calculateStatusTextField(),
      sensitive: isNsfwSensitiveEnabled,
      visibility: calculateVisibilityField(),
      inReplyToId: calculateInReplyToStatusField()?.remoteId,
      inReplyToConversationId: initialData.inReplyToConversationId,
      idempotencyKey: idempotencyKey,
      scheduledAt: scheduledAt,
      to: calculateToField(),
      poll: _calculatePleromaPostStatusPollField(),
      spoilerText: _calculateSpoilerTextField(),
    ));
    var success = scheduledStatus != null;
    return success;
  }

  @override
  void clear() {
    super.clear();

    visibilitySubject.add(initialData.visibility.toPleromaVisibility());
    alreadyMarkMediaNsfwByDefault = false;
    nsfwSensitiveSubject.add(false);

    clearSchedule();

    pollBloc.clear();

    subjectTextController.clear();
    subjectFocusNode.unfocus();
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

  Future onStatusPosted(IPleromaStatus remoteStatus) async {
    // nothing by default
  }

  List<String> calculateToField() {
    if (pleromaAuthStatusService.isPleromaInstance) {
      return mentionedAccts;
    } else {
      return null;
    }
  }

  String calculateStatusTextField() {
    if (pleromaAuthStatusService.isPleromaInstance) {
      return inputText;
    } else {
      if (originInReplyToStatus != null) {
        var inReplyToStatusAcct = originInReplyToStatus.account.acct;

        return "@${inReplyToStatusAcct} $inputText";
      } else {
        return inputText;
      }
    }
  }

  IStatus calculateInReplyToStatusField() =>
      mapRemoteStatusToLocalStatus(initialData.inReplyToPleromaStatus);

  IPostStatusPoll _calculatePostStatusPoll() {
    var poll;
    if (pollBloc.isSomethingChanged) {
      poll = PostStatusPoll(
        durationLength:
            pollBloc.durationDateTimeLengthFieldBloc.currentValueDuration,
        multiple: pollBloc.multiplyFieldBloc.currentValue,
        options: pollBloc.pollOptionsGroupBloc.items
            .map((item) => item.currentValue)
            .toList(),
        hideTotals: false,
      );
    }
    return poll;
  }

  PleromaPostStatusPoll _calculatePleromaPostStatusPollField() {
    var poll;
    if (pollBloc.isSomethingChanged) {
      var expiresInSeconds = pollBloc
          .durationDateTimeLengthFieldBloc.currentValueDuration.totalSeconds;

      poll = PleromaPostStatusPoll(
        expiresInSeconds: expiresInSeconds,
        multiple: pollBloc.multiplyFieldBloc.currentValue,
        options: pollBloc.pollOptionsGroupBloc.items
            .map((item) => item.currentValue)
            .toList(),
      );
    }
    return poll;
  }

  String _calculateSpoilerTextField() {
    String spoiler;

    if (subjectText?.trim()?.isNotEmpty == true) {
      spoiler = subjectText;
    }

    return spoiler;
  }

  @override
  final FocusNode subjectFocusNode = FocusNode();

  @override
  String get subjectText => subjectTextSubject.value;

  @override
  Stream<String> get subjectTextStream => subjectTextSubject.stream;

  @override
  final TextEditingController subjectTextController = TextEditingController();

  final BehaviorSubject<String> subjectTextSubject = BehaviorSubject();

  void onSubjectTextChanged() {
    var text = subjectTextController.text;

    if (subjectText != text) {
      subjectTextSubject.add(text);
    }
  }

  @override
  IPostStatusData calculateCurrentPostStatusData() => PostStatusData(
        subject: _calculateSpoilerTextField(),
        text: calculateStatusTextField(),
        scheduledAt: scheduledAt,
        visibility: visibility.toJsonValue(),
        mediaAttachments: _calculateMediaAttachmentsField()
            ?.map(
              (mediaAttachment) => PleromaMediaAttachment(
                description: mediaAttachment.description,
                id: mediaAttachment.id,
                previewUrl: mediaAttachment.previewUrl,
                remoteUrl: mediaAttachment.remoteUrl,
                textUrl: mediaAttachment.textUrl,
                type: mediaAttachment.type,
                url: mediaAttachment.url,
                pleroma: mediaAttachment.pleroma,
              ),
            )
            ?.toList(),
        poll: _calculatePostStatusPoll(),
        inReplyToPleromaStatus: mapLocalStatusToRemoteStatus(
          calculateInReplyToStatusField(),
        ),
        inReplyToConversationId: initialData.inReplyToConversationId,
        isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
        language: initialData.language,
        to: calculateToField(),
      );

  @override
  void onFileSelected() {
    super.onFileSelected();
    if (markMediaAsNsfwOnAttach) {
      nsfwSensitiveSubject.add(true);
    }
  }
}
