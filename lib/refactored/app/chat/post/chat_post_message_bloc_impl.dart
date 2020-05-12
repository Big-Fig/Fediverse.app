import 'package:fedi/refactored/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ChatPostMessageBloc extends DisposableOwner
    implements IChatPostMessageBloc {
  final IPleromaChatService pleromaChatService;
  final IChatMessageRepository chatMessageRepository;

  final String chatRemoteId;

  @override
  bool get isReadyToPost => calculateIsReadyToPost(inputText: inputText);

  @override
  Stream<bool> get isReadyToPostStream => inputTextStream
      .map((inputText) => calculateIsReadyToPost(inputText: inputText));

  // ignore: close_sinks
  BehaviorSubject<String> inputTextSubject = BehaviorSubject.seeded("");

  @override
  String get inputText => inputTextSubject.value;

  @override
  Stream<String> get inputTextStream => inputTextSubject.stream;

  @override
  TextEditingController inputTextController = TextEditingController();

  ChatPostMessageBloc({
    @required this.pleromaChatService,
    @required this.chatMessageRepository,
    @required this.chatRemoteId,
  }) {
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

  void onInputTextChanged() {
    var text = inputTextController.text;

    if (inputText != text) {
      inputTextSubject.add(text);
    }
  }

  @override
  Future<bool> postMessage() async {
    bool success;

    var remoteChatMessage = await pleromaChatService.sendMessage(
        chatId: chatRemoteId,
        data: PleromaChatMessageSendData(content: inputText));

    if (remoteChatMessage != null) {
      success = true;
      await chatMessageRepository.upsertRemoteChatMessage(remoteChatMessage);
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
  }

  bool calculateIsReadyToPost({@required String inputText}) {
    var textIsNotEmpty = inputText?.trim()?.isEmpty != true;

    return textIsNotEmpty;
  }

  static ChatPostMessageBloc createFromContext(BuildContext context,
          {@required String chatRemoteId}) =>
      ChatPostMessageBloc(
          chatRemoteId: chatRemoteId,
          chatMessageRepository:
              IChatMessageRepository.of(context, listen: false),
          pleromaChatService: IPleromaChatService.of(context, listen: false));
}
