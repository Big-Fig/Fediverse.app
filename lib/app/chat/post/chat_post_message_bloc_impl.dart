import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_grid_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_grid_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("chat_post_message_bloc_impl.dart");

// todo: unify post status & post chat message code
class ChatPostMessageBloc extends DisposableOwner
    implements IChatPostMessageBloc {
  final IPleromaChatService pleromaChatService;
  final IChatMessageRepository chatMessageRepository;
  final String chatRemoteId;

  @override
  final IUploadMediaAttachmentGridBloc mediaAttachmentGridBloc;

  ChatPostMessageBloc({
    @required this.pleromaChatService,
    @required this.chatMessageRepository,
    @required this.chatRemoteId,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
  }) : mediaAttachmentGridBloc = UploadMediaAttachmentGridBloc(
            maximumMediaAttachmentCount: 1,
            pleromaMediaAttachmentService: pleromaMediaAttachmentService) {
    assert(pleromaMediaAttachmentService != null);
    addDisposable(disposable: mediaAttachmentGridBloc);

    addDisposable(subject: inputTextSubject);

    addDisposable(textEditingController: inputTextController);

    var editTextListener = () {
      onInputTextChanged();
    };
    inputTextController.addListener(editTextListener);

    addDisposable(disposable: CustomDisposable(() {
      inputTextController.removeListener(editTextListener);
    }));
  }

  @override
  bool get isReadyToPost => calculateIsReadyToPost(
      inputText: inputText,
      mediaAttachmentBlocs: mediaAttachmentGridBloc.mediaAttachmentBlocs);

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest2(
      inputTextStream,
      mediaAttachmentGridBloc.mediaAttachmentBlocsStream,
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
  TextEditingController inputTextController = TextEditingController();

  void onInputTextChanged() {
    var text = inputTextController.text;

    if (inputText != text) {
      inputTextSubject.add(text);
    }
  }

  @override
  Future<bool> postMessage() async {
    bool success;

    var mediaAttachmentBlocs = mediaAttachmentGridBloc.mediaAttachmentBlocs;
    var mediaId;
    if (mediaAttachmentBlocs?.isNotEmpty == true) {
      mediaId = mediaAttachmentBlocs.first.pleromaMediaAttachment.id;
    }

    var data = PleromaChatMessageSendData(content: inputText, mediaId: mediaId);
    _logger.finest(() => "postMessage data=$data");
    var remoteChatMessage =
        await pleromaChatService.sendMessage(chatId: chatRemoteId, data: data);

    _logger.finest(() => "postMessage remoteChatMessage=$remoteChatMessage");
    if (remoteChatMessage != null) {
      success = true;
      await chatMessageRepository.upsertRemoteChatMessage(remoteChatMessage);

      // todo: remove hack
      // backend shouldn't mark chat as unread after message from me
      await pleromaChatService.markChatAsRead(
        chatId: chatRemoteId,
        lastReadChatMessageId: remoteChatMessage.id,
      );
    } else {
      success = false;
    }

    if (success) {
      _clear();
    }
    return success;
  }

  void _clear() {
    inputTextController.clear();
    mediaAttachmentGridBloc.clear();
  }

  bool calculateIsReadyToPost(
      {@required String inputText,
      @required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs}) {
    var textIsNotEmpty = inputText?.trim()?.isEmpty != true;
    var mediaAttached = mediaAttachmentBlocs?.isEmpty != true;

    return textIsNotEmpty || mediaAttached;
  }

  @override
  void appendText(String textToAppend) {
    inputTextController.text = "$inputText$textToAppend";
  }

  static ChatPostMessageBloc createFromContext(BuildContext context,
          {@required String chatRemoteId}) =>
      ChatPostMessageBloc(
          chatRemoteId: chatRemoteId,
          chatMessageRepository:
              IChatMessageRepository.of(context, listen: false),
          pleromaChatService: IPleromaChatService.of(context, listen: false),
          pleromaMediaAttachmentService:
              IPleromaMediaAttachmentService.of(context, listen: false));
}
