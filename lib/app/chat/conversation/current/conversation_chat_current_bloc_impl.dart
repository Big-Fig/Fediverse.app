import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';

class ConversationChatCurrentBloc extends DisposableOwner
    implements IConversationChatCurrentBloc {
  BehaviorSubject<IConversationChat> currentChatSubject = BehaviorSubject();

  ConversationChatCurrentBloc() {
    addDisposable(subject: currentChatSubject);
  }

  @override
  IConversationChat get currentChat => currentChatSubject.value;

  @override
  Stream<IConversationChat> get currentChatStream => currentChatSubject.stream;

  @override
  void onChatOpened(IConversationChat chat) {
    assert(currentChat == null);
    currentChatSubject.add(chat);
  }

  @override
  void onChatClosed(IConversationChat chat) {
    assert(currentChat != null);
    assert(currentChat.remoteId == chat.remoteId);
    currentChatSubject.add(null);
  }
}
