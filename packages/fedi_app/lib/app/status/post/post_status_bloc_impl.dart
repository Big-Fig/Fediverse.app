import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi_app/app/message/post_message_bloc_impl.dart';
import 'package:fedi_app/app/message/post_message_model.dart';
import 'package:fedi_app/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi_app/app/status/post/poll/post_status_poll_bloc_impl.dart';
import 'package:fedi_app/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:fedi_app/duration/duration_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('post_status_bloc_impl.dart');

final findAcctsRegex = RegExp(r'\B\@(([\w.@\-]+))');

abstract class PostStatusBloc extends PostMessageBloc
    implements IPostStatusBloc {
  @override
  final bool isExpirePossible;

  @override
  bool get isAnyTextEntered =>
      inputText?.isNotEmpty == true || subjectText?.isNotEmpty == true;

  @override
  Stream<bool> get isAnyTextEnteredStream => Rx.combineLatest2(
        inputTextStream,
        subjectTextStream,
        (String? inputText, String? subjectText) =>
            inputText?.isNotEmpty == true || subjectText?.isNotEmpty == true,
      );

  @override
  bool get isAnyDataEntered =>
      isAnyTextEntered ||
      uploadMediaAttachmentsBloc.uploadMediaAttachmentBlocs.isNotEmpty ||
      pollBloc.isSomethingChanged;

  final bool markMediaAsNsfwOnAttach;

  bool alreadyMarkMediaNsfwByDefault = false;
  final IUnifediApiInstancePollLimits? pollLimits;

  // todo: refactor arguments in class
  // ignore: long-method
  PostStatusBloc({
    required this.unifediApiStatusService,
    required this.statusRepository,
    required this.scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required int? maximumMediaAttachmentCount,
    required int? maximumMessageLength,
    required IPostStatusData? initialData,
    List<IAccount>? initialAccountsToMention = const [],
    required this.pollLimits,
    required int? maximumFileSizeInBytes,
    required this.markMediaAsNsfwOnAttach,
    required bool dontUploadMediaDuringEditing,
    required this.isExpirePossible,
    required bool unfocusOnClear,
  }) : super(
          dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
          maximumMessageLength: maximumMessageLength,
          unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          unfocusOnClear: unfocusOnClear,
        ) {
    initialData = initialData ?? defaultInitData;
    // ignore: prefer_initializing_formals
    this.initialData = initialData;
    visibilitySubject = BehaviorSubject.seeded(
      initialData.visibilityString.toUnifediApiVisibility(),
    );
    nsfwSensitiveSubject = BehaviorSubject.seeded(
      initialData.isNsfwSensitiveEnabled,
    );

    pollBloc = PostStatusPollBloc(
      pollLimits: pollLimits,
    );

    selectedActionSubject.disposeWith(this);
    mentionedAcctsSubject.disposeWith(this);
    visibilitySubject.disposeWith(this);
    scheduledAtSubject.disposeWith(this);
    expireAtSubject.disposeWith(this);

    addDisposable(pollBloc);

    void focusListener() {
      onFocusChange(inputFocusNode.hasFocus);
    }

    inputFocusNode.addListener(focusListener);

    addCustomDisposable(
      () => inputFocusNode.removeListener(
        focusListener,
      ),
    );

    subjectFocusNode.disposeWith(this);
    subjectTextController.disposeWith(this);
    subjectTextSubject.disposeWith(this);

    void editTextListener() {
      onSubjectTextChanged();
    }

    subjectTextController.addListener(editTextListener);

    addDisposable(
      CustomDisposable(
        () async {
          subjectTextController.removeListener(editTextListener);
        },
      ),
    );

    if (initialAccountsToMention?.isNotEmpty == true) {
      for (final account in initialAccountsToMention!) {
        mentionedAccts.add(account.acct);
      }

      onMentionedAccountsChanged();
    }

    if (initialData.scheduledAt != null) {
      scheduledAtSubject.add(initialData.scheduledAt);
    }
    if (initialData.expiresInSeconds != null) {
      expireAtSubject.add(
        Duration(
          seconds: initialData.expiresInSeconds!,
        ),
      );
    }
    var initialDataSubject = initialData.subject;
    if (initialDataSubject != null) {
      subjectTextController.text = initialDataSubject;
    }
    var initialDataText = initialData.text;
    if (initialDataText != null) {
      inputTextController.text = initialDataText;
    }
    var initialDataPoll = initialData.poll;
    if (initialDataPoll != null) {
      pollBloc.fillFormData(initialDataPoll);
    }
    var initialDataMediaAttachments = initialData.mediaAttachments;
    if (initialDataMediaAttachments != null) {
      // ignore: prefer_foreach
      for (final attachment in initialDataMediaAttachments) {
        uploadMediaAttachmentsBloc.addUploadedAttachment(attachment);
      }
    }
    if (markMediaAsNsfwOnAttach) {
      uploadMediaAttachmentsBloc.uploadMediaAttachmentBlocsStream.listen(
        (blocs) {
          if (!alreadyMarkMediaNsfwByDefault && blocs.isNotEmpty) {
            alreadyMarkMediaNsfwByDefault = true;
            nsfwSensitiveSubject.add(true);
          }
        },
      ).disposeWith(this);
    }

    pollBloc.isSomethingChangedStream.listen(
      (_) {
        _checkPollEmptyInputError();
      },
    ).disposeWith(this);

    inputTextStream.listen(
      (_) {
        _checkPollEmptyInputError();
      },
    ).disposeWith(this);
  }

  static const postMessagePollEmptyInputTextError =
      PostMessagePollEmptyInputTextError();

  void _checkPollEmptyInputError() {
    var isSomethingChangedPollBloc = pollBloc.isSomethingChanged;

    // _logger.finest(() => '_checkPollEmptyInputError '
    //     'isSomethingChangedPollBloc $isSomethingChangedPollBloc');
    var currentInputTextErrors = inputTextErrors;
    if (isSomethingChangedPollBloc) {
      var textIsNotEmpty = inputText?.isNotEmpty == true;
      _logger.finest(
        () => '_checkPollEmptyInputError '
            'textIsNotEmpty $textIsNotEmpty',
      );
      if (textIsNotEmpty) {
        // ignore: avoid-ignoring-return-values
        currentInputTextErrors.remove(postMessagePollEmptyInputTextError);
        inputTextErrorsSubject.add([...currentInputTextErrors]);
      } else {
        if (!currentInputTextErrors
            .contains(postMessagePollEmptyInputTextError)) {
          currentInputTextErrors.add(postMessagePollEmptyInputTextError);
          inputTextErrorsSubject.add([...currentInputTextErrors]);
        }
        _logger.finest(
          () => '_checkPollEmptyInputError '
              'add inputTextErrors $currentInputTextErrors',
        );
      }
    } else {
      // ignore: avoid-ignoring-return-values
      currentInputTextErrors.remove(postMessagePollEmptyInputTextError);
      inputTextErrorsSubject.add([...currentInputTextErrors]);
    }
  }

  final IUnifediApiStatusService unifediApiStatusService;
  final IStatusRepository statusRepository;
  final IScheduledStatusRepository scheduledStatusRepository;

  @override
  IStatus? get originInReplyToStatus =>
      initialData.inReplyToUnifediApiStatus?.toDbStatusPopulatedWrapper();

  String? get inReplyToStatusRemoteId => originInReplyToStatus?.remoteId;

  @override
  // ignore: avoid-late-keyword
  late IPostStatusPollBloc pollBloc;

  // ignore: avoid-late-keyword
  late IPostStatusData initialData;

  static final PostStatusData defaultInitData = PostStatusData(
    subject: null,
    text: null,
    scheduledAt: null,
    visibilityString: UnifediApiVisibility.publicValue.stringValue,
    mediaAttachments: null,
    poll: null,
    inReplyToUnifediApiStatus: null,
    inReplyToConversationId: null,
    isNsfwSensitiveEnabled: false,
    to: null,
    language: null,
    expiresInSeconds: null,
  );

  // ignore: no-empty-block, avoid_positional_boolean_parameters
  void onFocusChange(bool hasFocus) {
    // nothing by default
  }

  @override
  bool get isHaveMentionedAccts => mentionedAccts.isNotEmpty;

  @override
  Stream<bool> get isHaveMentionedAcctsStream =>
      mentionedAcctsStream.map((mentionedAccts) => mentionedAccts.isNotEmpty);

  // ignore: close_sinks
  BehaviorSubject<List<String>> mentionedAcctsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<String> get mentionedAccts => mentionedAcctsSubject.value;

  @override
  Stream<List<String>> get mentionedAcctsStream => mentionedAcctsSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<DateTime?> scheduledAtSubject = BehaviorSubject();

  @override
  bool get isScheduledAtExist => scheduledAt != null;

  @override
  Stream<bool> get isScheduledAtExistStream =>
      scheduledAtStream.map((scheduledAt) => scheduledAt != null);

  @override
  DateTime? get scheduledAt => scheduledAtSubject.valueOrNull;

  @override
  Stream<DateTime?> get scheduledAtStream => scheduledAtSubject.stream;

  // ignore: close_sinks, avoid-late-keyword
  late BehaviorSubject<UnifediApiVisibility> visibilitySubject;

  @override
  UnifediApiVisibility get visibility => visibilitySubject.value;

  @override
  Stream<UnifediApiVisibility> get visibilityStream => visibilitySubject.stream;

  // ignore: close_sinks, avoid-late-keyword
  late BehaviorSubject<bool> nsfwSensitiveSubject;

  @override
  bool get isNsfwSensitiveEnabled => nsfwSensitiveSubject.value;

  @override
  Stream<bool> get isNsfwSensitiveEnabledStream => nsfwSensitiveSubject.stream;

  @override
  bool get isReadyToPost => calculateStatusBlocIsReadyToPost(
        inputText: inputWithoutMentionedAcctsText,
        mediaAttachmentBlocs:
            uploadMediaAttachmentsBloc.uploadMediaAttachmentBlocs,
        isAllAttachedMediaUploaded:
            uploadMediaAttachmentsBloc.isAllAttachedMediaUploaded,
        isPollBlocHaveErrors: pollBloc.isHaveAtLeastOneError,
        isPollBlocChanged: pollBloc.isSomethingChanged,
      );

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest5(
        inputWithoutMentionedAcctsTextStream,
        uploadMediaAttachmentsBloc.uploadMediaAttachmentBlocsStream,
        uploadMediaAttachmentsBloc.isAllAttachedMediaUploadedStream,
        pollBloc.isHaveAtLeastOneErrorStream,
        pollBloc.isSomethingChangedStream,
        (
          String? inputWithoutMentionedAcctsText,
          List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
          bool isAllAttachedMediaUploaded,
          bool isHaveAtLeastOneError,
          bool isPollBlocChanged,
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
    required String? inputText,
    required List<IUploadMediaAttachmentBloc>? mediaAttachmentBlocs,
    required bool? isAllAttachedMediaUploaded,
    required bool isPollBlocHaveErrors,
    required bool? isPollBlocChanged,
  }) {
    var isReady = super.calculateIsReadyToPost(
      inputText: inputText,
      mediaAttachmentBlocs: mediaAttachmentBlocs,
      isAllAttachedMediaUploaded: isAllAttachedMediaUploaded,
    );

    return isReady && (!isPollBlocChanged! || !isPollBlocHaveErrors);
  }

  @override
  String? get inputWithoutMentionedAcctsText =>
      removeAcctsFromText(inputText, mentionedAccts);

  @override
  Stream<String?> get inputWithoutMentionedAcctsTextStream => Rx.combineLatest2(
        inputTextStream,
        mentionedAcctsStream,
        removeAcctsFromText,
      );

  void onMentionedAccountsChanged() {
    var mentionedAccts = this.mentionedAccts;
    mentionedAcctsSubject.add(mentionedAccts);
    _logger.finest(() => 'onMentionedAccountsChanged $mentionedAccts');
    var text = inputTextController.text;
    var textAccts = findAcctMentionsInText(text);

    var acctsToAdd =
        mentionedAccts.where((acct) => !textAccts.contains(acct)).toList();
    var acctsToRemove =
        textAccts.where((acct) => !mentionedAccts.contains(acct)).toList();
    if (acctsToAdd.isNotEmpty || acctsToRemove.isNotEmpty) {
      String? newText = prependAccts(text, acctsToAdd);
      newText = removeAcctsFromText(newText, acctsToRemove);
      _logger.finest(() => 'onMentionedAccountsChanged newText $newText');
      inputTextController.text = newText!;
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
        _logger.finest(
          () => 'onInputTextChanged \n'
              '\t acctsToAdd=$acctsToAdd'
              '\t acctsToRemove=$acctsToRemove,',
        );
        mentionedAccts.addAll(acctsToAdd);

        // ignore: prefer_foreach
        for (final acct in acctsToRemove) {
          // ignore: avoid-ignoring-return-values
          mentionedAccts.remove(acct);
        }
        mentionedAcctsSubject.add(mentionedAccts);
      }
    }
  }

  static List<String> findAcctMentionsInText(String text) {
    var matches = findAcctsRegex.allMatches(text);

    return matches
        .map(
          (match) => // group(0) is all match
              // group(1) is acct without first @
              match.group(1)!,
        )
        .toList();
  }

  static String prependAccts(String text, List<String?> accts) {
    if (accts.isNotEmpty) {
      var acctsString = accts.map((acct) => '@$acct').join(', ');

      return '$acctsString $text';
    } else {
      return text;
    }
  }

  @override
  void addAccountMentions(List<IAccount?> accounts) {
    var accts = accounts.map((account) => account!.acct);

    // remove duplicates
    removeAccountMentions(accounts);
    mentionedAccts.addAll(accts);

    onMentionedAccountsChanged();
  }

  @override
  void removeAccountMentions(List<IAccount?> accounts) {
    var accts = accounts.map((account) => account!.acct);

    mentionedAccts.removeWhere((acct) => accts.contains(acct));

    onMentionedAccountsChanged();
  }

  @override
  void removeMentionByAcct(String acct) {
    if (mentionedAccts.contains(acct)) {
      // ignore: avoid-ignoring-return-values
      mentionedAccts.remove(acct);
      onMentionedAccountsChanged();
    }
  }

  @override
  void changeVisibility(UnifediApiVisibility visibility) {
    visibilitySubject.add(visibility);
  }

  @override
  void changeNsfwSensitive(bool nsfwSensitive) {
    nsfwSensitiveSubject.add(nsfwSensitive);
  }

  bool isMaximumAttachmentReached({
    required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
    required int maximumMediaAttachmentCount,
  }) =>
      mediaAttachmentBlocs.length >= maximumMediaAttachmentCount;

  @override
  Future<void> post() async {
    var success = await tryUploadAllAttachments();

    if (!success) {
      return;
    }

    var postStatusData = calculateCurrentPostStatusData();

    await internalPostStatusData(postStatusData);
  }

  Future<void> internalPostStatusData(IPostStatusData postStatusData) async {
    if (isScheduledAtExist) {
      await actualScheduleStatus();
    } else {
      await actualPostStatus();
    }
    clear();
  }

  String calculateVisibilityField() => visibility.stringValue;

  List<String>? _calculateMediaIdsField() => _calculateMediaAttachmentsField()
      ?.map((mediaAttachment) => mediaAttachment.id)
      .toList();

  List<IUnifediApiMediaAttachment>? _calculateMediaAttachmentsField() {
    List<IUnifediApiMediaAttachment>? mediaAttachments =
        uploadMediaAttachmentsBloc.uploadMediaAttachmentBlocs
            .where(
              (bloc) =>
                  bloc.uploadState.type ==
                  UploadMediaAttachmentStateType.uploaded,
            )
            .map((bloc) => bloc.unifediApiMediaAttachment!)
            .toList();
    // media ids shouldnt be empty (should be null in this case)
    if (mediaAttachments.isEmpty) {
      mediaAttachments = null;
    }

    return mediaAttachments;
  }

  @override
  void clear() {
    super.clear();

    visibilitySubject
        .add(initialData.visibilityString.toUnifediApiVisibility());
    alreadyMarkMediaNsfwByDefault = false;
    nsfwSensitiveSubject.add(false);

    clearScheduleAt();
    clearExpireDuration();

    pollBloc.clear();

    subjectTextController.clear();
    subjectFocusNode.unfocus();
  }

  String? removeAcctsFromText(
    String? inputText,
    List<String?>? mentionedAccts,
  ) {
    var newText = inputText;
    // todo: better performance via Regex
    mentionedAccts?.forEach(
      (acctToRemove) {
        newText = newText!.replaceAll('@$acctToRemove, ', '');
        newText = newText!.replaceAll('@$acctToRemove,', '');
        newText = newText!.replaceAll(' @$acctToRemove ', '');
        newText = newText!.replaceAll('@$acctToRemove', '');
      },
    );

    return newText;
  }

  @override
  void setScheduledAt(DateTime? dateTime) {
    scheduledAtSubject.add(dateTime);
  }

  @override
  void clearScheduleAt() {
    setScheduledAt(null);
  }

  // ignore: no-empty-block
  Future<void> onStatusPosted(IUnifediApiStatus remoteStatus) async {
    // nothing by default
  }

  List<String>? calculateToField() {
    // todo: rework
    var isPleroma = unifediApiStatusService
        .restService.accessBloc.access.instance!.typeAsUnifediApi.isPleroma;
    if (isPleroma) {
      return mentionedAccts;
    } else {
      return null;
    }
  }

  String? calculateStatusTextField() {
    // todo: rework
    var isPleroma = unifediApiStatusService
        .restService.accessBloc.access.instance!.typeAsUnifediApi.isPleroma;
    if (isPleroma) {
      return inputText;
    } else {
      if (originInReplyToStatus != null) {
        var inReplyToStatusAcct = originInReplyToStatus!.account.acct;

        return '@$inReplyToStatusAcct $inputText';
      } else {
        return inputText;
      }
    }
  }

  IStatus? calculateInReplyToStatusField() =>
      initialData.inReplyToUnifediApiStatus?.toDbStatusPopulatedWrapper();

  IPostStatusPoll? _calculatePostStatusPoll() {
    IPostStatusPoll? poll;
    if (pollBloc.isSomethingChanged) {
      poll = PostStatusPoll(
        durationLength:
            pollBloc.durationDateTimeLengthFieldBloc.currentValueDuration,
        multiple: pollBloc.multiplyFieldBloc.currentValue,
        options: pollBloc.pollOptionsGroupBloc.items
            .map((item) => item.currentValue)
            .where((item) => item.isNotEmpty)
            .toList(),
        hideTotals: pollBloc.hideTotalsFieldBloc.currentValue,
      );
    }

    return poll;
  }

  UnifediApiPostStatusPoll? _calculatePostStatusPollField() {
    UnifediApiPostStatusPoll? poll;
    if (pollBloc.isSomethingChanged) {
      var expiresInSeconds = pollBloc
          .durationDateTimeLengthFieldBloc.currentValueDuration!.totalSeconds;

      poll = UnifediApiPostStatusPoll(
        expiresInSeconds: expiresInSeconds,
        multiple: pollBloc.multiplyFieldBloc.currentValue,
        options: pollBloc.pollOptionsGroupBloc.items
            .map((item) => item.currentValue)
            .where((item) => item.isNotEmpty)
            .toList(),
        hideTotals: pollBloc.hideTotalsFieldBloc.currentValue,
      );
    }

    return poll;
  }

  String? _calculateSpoilerTextField() {
    String? spoiler;

    if (subjectText?.trim().isNotEmpty == true) {
      spoiler = subjectText;
    }

    return spoiler;
  }

  @override
  final FocusNode subjectFocusNode = FocusNode();

  @override
  String? get subjectText => subjectTextSubject.valueOrNull;

  @override
  Stream<String?> get subjectTextStream => subjectTextSubject.stream;

  @override
  final TextEditingController subjectTextController = TextEditingController();

  final BehaviorSubject<String?> subjectTextSubject = BehaviorSubject();

  void onSubjectTextChanged() {
    var text = subjectTextController.text;

    if (subjectText != text) {
      subjectTextSubject.add(text);
    }
  }

  @override
  void onFileSelected() {
    super.onFileSelected();
    if (markMediaAsNsfwOnAttach) {
      nsfwSensitiveSubject.add(true);
    }
  }

  // ignore: close_sinks
  BehaviorSubject<Duration?> expireAtSubject = BehaviorSubject();

  @override
  bool get isExpireDurationExist => expireDuration != null;

  @override
  Stream<bool> get isExpireDurationExistStream =>
      expireDurationStream.map((expireAt) => expireAt != null);

  @override
  Duration? get expireDuration => expireAtSubject.valueOrNull;

  @override
  Stream<Duration?> get expireDurationStream => expireAtSubject.stream;

  @override
  void clearExpireDuration() {
    setExpireDuration(null);
  }

  @override
  void setExpireDuration(Duration? duration) {
    expireAtSubject.add(duration);
  }

  Future<void> actualPostStatus() async {
    var unifediApiPostStatus = calculatePostStatus();
    var remoteStatus = await unifediApiStatusService.postStatus(
      idempotencyKey: idempotencyKey,
      postStatus: unifediApiPostStatus,
    );

    var unifediApiVisibility =
        UnifediApiVisibility.fromStringValue(unifediApiPostStatus.visibility);

    var isFromHomeTimeline =
        unifediApiVisibility == UnifediApiVisibility.publicValue;

    await statusRepository.upsertRemoteStatusWithAllArguments(
      remoteStatus,
      conversationRemoteId: initialData.inReplyToConversationId,
      batchTransaction: null,
      listRemoteId: null,
      isFromHomeTimeline: isFromHomeTimeline,
    );
    await onStatusPosted(remoteStatus);
    var inReplyToStatusRemoteId = this.inReplyToStatusRemoteId;
    if (inReplyToStatusRemoteId != null) {
      try {
        await statusRepository.incrementRepliesCount(
          remoteId: inReplyToStatusRemoteId,
        );
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(
          () => 'failed to incrementRepliesCount $inReplyToStatusRemoteId',
          e,
          stackTrace,
        );
      }
    }
  }

  Future<void> actualScheduleStatus() async {
    var scheduledStatus = await unifediApiStatusService.scheduleStatus(
      idempotencyKey: idempotencyKey,
      postStatus: calculateScheduleStatus(),
    );
    // ignore: avoid-ignoring-return-values
    await scheduledStatusRepository.upsertInRemoteType(scheduledStatus);
  }

  @override
  IPostStatusData calculateCurrentPostStatusData() => PostStatusData(
        subject: _calculateSpoilerTextField(),
        text: calculateStatusTextField(),
        scheduledAt: scheduledAt,
        visibilityString: visibility.stringValue,
        mediaAttachments: _calculateMediaAttachmentsField()
            ?.map(
              (mediaAttachment) => UnifediApiMediaAttachment(
                description: mediaAttachment.description,
                id: mediaAttachment.id,
                previewUrl: mediaAttachment.previewUrl,
                remoteUrl: mediaAttachment.remoteUrl,
                textUrl: mediaAttachment.textUrl,
                type: mediaAttachment.type,
                url: mediaAttachment.url,
                blurhash: null,
                meta: null,
                mimeType: null,
              ),
            )
            .toList(),
        poll: _calculatePostStatusPoll()?.toPostStatusPoll(),
        inReplyToUnifediApiStatus:
            calculateInReplyToStatusField()?.toUnifediApiStatus(),
        inReplyToConversationId: initialData.inReplyToConversationId,
        isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
        language: initialData.language,
        to: calculateToField(),
        expiresInSeconds: expireAtSubject.valueOrNull?.totalSeconds,
      );

  UnifediApiSchedulePostStatus calculateScheduleStatus() =>
      UnifediApiSchedulePostStatus(
        mediaIds: _calculateMediaIdsField(),
        status: calculateStatusTextField(),
        sensitive: isNsfwSensitiveEnabled,
        visibility: calculateVisibilityField(),
        inReplyToId: calculateInReplyToStatusField()?.remoteId,
        inReplyToConversationId: initialData.inReplyToConversationId,
        scheduledAt: scheduledAt!,
        to: calculateToField(),
        poll: _calculatePostStatusPollField(),
        spoilerText: _calculateSpoilerTextField(),
        expiresInSeconds: expireAtSubject.valueOrNull?.totalSeconds,
        language: initialData.language,
        preview: null,
        contentType: null,
      );

  UnifediApiPostStatus calculatePostStatus() => UnifediApiPostStatus(
        mediaIds: _calculateMediaIdsField(),
        status: calculateStatusTextField(),
        sensitive: isNsfwSensitiveEnabled,
        visibility: calculateVisibilityField(),
        inReplyToId: calculateInReplyToStatusField()?.remoteId,
        inReplyToConversationId: initialData.inReplyToConversationId,
        to: calculateToField(),
        poll: _calculatePostStatusPollField(),
        spoilerText: _calculateSpoilerTextField(),
        language: initialData.language,
        expiresInSeconds: expireAtSubject.valueOrNull?.totalSeconds,
        contentType: null,
        preview: null,
      );

  @override
  void appendText(
    String textToAppend, {
    bool requestFocus = true,
  }) {
    var subjectFocused = subjectFocusNode.hasFocus;
    if (subjectFocused) {
      var originalText = subjectText;
      subjectTextController.value = createAppendTextEditingValue(
        originalText: originalText ?? '',
        textToAppend: textToAppend,
      );
    } else {
      super.appendText(textToAppend, requestFocus: requestFocus);
    }
  }
}
