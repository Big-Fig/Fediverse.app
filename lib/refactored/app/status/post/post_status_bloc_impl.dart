import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc_impl.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("post_status_bloc_impl.dart");

final findAcctsRegex = RegExp(r"\B\@(([\w.@\-]+))");

abstract class PostStatusBloc extends DisposableOwner
    implements IPostStatusBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatusRepository statusRepository;
  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;
  @override
  final int maximumMediaAttachmentCount;
  final String conversationRemoteId;
  final String inReplyToStatusRemoteId;

  bool get isHaveMentionedAccts => mentionedAccts?.isNotEmpty == true;
  Stream<bool> get isHaveMentionedAcctsStream => mentionedAcctsStream
      .map((mentionedAccts) => mentionedAccts?.isNotEmpty == true);

  String idempotencyKey;

  _regenerateIdempotencyKey() {
    idempotencyKey = DateTime.now().millisecondsSinceEpoch.toString();
  }

  // ignore: close_sinks
  BehaviorSubject<List<IUploadMediaAttachmentBloc>>
      mediaAttachmentBlocsSubject = BehaviorSubject.seeded([]);

  @override
  List<IUploadMediaAttachmentBloc> get mediaAttachmentBlocs =>
      mediaAttachmentBlocsSubject.value;

  @override
  Stream<List<IUploadMediaAttachmentBloc>> get mediaAttachmentBlocsStream =>
      mediaAttachmentBlocsSubject.stream;

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
  bool get nsfwSensitive => nsfwSensitiveSubject.value;

  @override
  Stream<bool> get nsfwSensitiveStream => nsfwSensitiveSubject.stream;

  @override
  bool get isMaximumMediaAttachmentCountReached => isMaximumAttachmentReached(
      mediaAttachmentBlocs: mediaAttachmentBlocs,
      maximumMediaAttachmentCount: maximumMediaAttachmentCount);

  @override
  Stream<bool> get isMaximumMediaAttachmentCountReachedStream =>
      mediaAttachmentBlocsStream.map((mediaAttachmentBlocs) =>
          isMaximumAttachmentReached(
              mediaAttachmentBlocs: mediaAttachmentBlocs,
              maximumMediaAttachmentCount: maximumMediaAttachmentCount));

  @override
  bool get isPossibleToAttachMedia => !isMaximumMediaAttachmentCountReached;

  @override
  Stream<bool> get isPossibleToAttachMediaStream =>
      isMaximumMediaAttachmentCountReachedStream.map((value) => !value);

  @override
  bool get isReadyToPost => calculateIsReadyToPost(
      inputText: inputWithoutMentionedAcctsText,
      mediaAttachmentBlocs: mediaAttachmentBlocs);

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest2(
      inputWithoutMentionedAcctsTextStream,
      mediaAttachmentBlocsStream,
      (inputWithoutMentionedAcctsText, mediaAttachmentBlocs) =>
          calculateIsReadyToPost(
              inputText: inputWithoutMentionedAcctsText,
              mediaAttachmentBlocs: mediaAttachmentBlocs));

  // ignore: close_sinks
  BehaviorSubject<String> inputTextSubject = BehaviorSubject.seeded("");

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

  PostStatusBloc({
    @required this.pleromaStatusService,
    @required this.statusRepository,
    @required this.pleromaMediaAttachmentService,
    this.conversationRemoteId,
    this.inReplyToStatusRemoteId,
    this.maximumMediaAttachmentCount = 4,
    PleromaVisibility initialVisibility = PleromaVisibility.PUBLIC,
    List<IAccount> initialAccountsToMention = const [],
  }) {
    assert(pleromaMediaAttachmentService != null);
    visibilitySubject = BehaviorSubject.seeded(initialVisibility);
    nsfwSensitiveSubject = BehaviorSubject.seeded(false);

    addDisposable(subject: mediaAttachmentBlocsSubject);
    addDisposable(subject: mentionedAcctsSubject);
    addDisposable(subject: inputTextSubject);
    addDisposable(subject: visibilitySubject);
    addDisposable(subject: scheduledAtSubject);
    addDisposable(disposable: CustomDisposable(() {
      mediaAttachmentBlocs.forEach((bloc) {
        bloc.dispose();
      });
    }));

    addDisposable(textEditingController: inputTextController);

    var editTextListener = () {
      onInputTextChanged();
    };
    inputTextController.addListener(editTextListener);

    addDisposable(disposable: CustomDisposable(() {
      inputTextController.removeListener(editTextListener);
    }));

    if (initialAccountsToMention?.isNotEmpty == true) {
      initialAccountsToMention.forEach((account) {
        addMentionByAccount(account);
      });
    }
  }

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
  addMentionByAccount(IAccount account) {
    var acct = account.acct;
    if (!mentionedAccts.contains(acct)) {
      mentionedAccts.add(acct);
      onMentionedAccountsChanged();
    }
  }

  @override
  removeMentionByAccount(IAccount account) {
    removeMentionByAcct(account.acct);
  }

  @override
  removeMentionByAcct(String acct) {
    if (mentionedAccts.contains(acct)) {
      mentionedAccts.remove(acct);
      onMentionedAccountsChanged();
    }
  }

  @override
  attachMedia(FilePickerFile filePickerFile) {
    var existedBloc = findMediaAttachmentBlocByFilePickerFile(filePickerFile);

    if (existedBloc == null) {
      var uploadMediaAttachmentBloc = UploadMediaAttachmentBloc(
          filePickerFile: filePickerFile,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService);
      uploadMediaAttachmentBloc.startUpload();
      mediaAttachmentBlocs.add(uploadMediaAttachmentBloc);
      mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
    }
    _regenerateIdempotencyKey();
  }

  @override
  detachMedia(FilePickerFile filePickerFile) {
    var existedBloc = findMediaAttachmentBlocByFilePickerFile(filePickerFile);
    if (existedBloc != null) {
      existedBloc.dispose();
      mediaAttachmentBlocs.remove(existedBloc);
      mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
    }
    _regenerateIdempotencyKey();
  }

  IUploadMediaAttachmentBloc findMediaAttachmentBlocByFilePickerFile(
          FilePickerFile filePickerFile) =>
      mediaAttachmentBlocs.firstWhere((bloc) {
        return bloc.filePickerFile == filePickerFile;
      }, orElse: () => null);

  @override
  changeVisibility(PleromaVisibility visibility) {
    visibilitySubject.add(visibility);
  }

  @override
  changeNsfwSensitive(bool nsfwSensitive) {
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
            mediaIds: mediaAttachmentBlocs
                ?.map((bloc) => bloc.pleromaMediaAttachment.id)
                ?.toList(),
            status: inputText,
            sensitive: nsfwSensitive,
            visibility: pleromaVisibilityValues.reverse[visibility],
            inReplyToId: inReplyToStatusRemoteId,
            inReplyToConversationId: conversationRemoteId,
            idempotencyKey: idempotencyKey));

    var success;
    if (remoteStatus != null) {
      await statusRepository.upsertRemoteStatus(remoteStatus,
          listRemoteId: null, conversationRemoteId: conversationRemoteId);
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  Future<bool> _scheduleStatus() async {
    var scheduledStatus = await pleromaStatusService.scheduleStatus(
        data: PleromaScheduleStatus(
            mediaIds: mediaAttachmentBlocs
                ?.map((bloc) => bloc.pleromaMediaAttachment.id)
                ?.toList(),
            status: inputText,
            sensitive: nsfwSensitive,
            visibility: pleromaVisibilityValues.reverse[visibility],
            inReplyToId: inReplyToStatusRemoteId,
            inReplyToConversationId: conversationRemoteId,
            idempotencyKey: idempotencyKey,
            scheduledAt: scheduledAt));
    var success = scheduledStatus != null;
    return success;
  }

  void _clear() {
    inputTextController.clear();
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

  schedule(DateTime dateTime) {
    scheduledAtSubject.add(dateTime);
  }

  clearSchedule() {
    schedule(null);
  }
}
