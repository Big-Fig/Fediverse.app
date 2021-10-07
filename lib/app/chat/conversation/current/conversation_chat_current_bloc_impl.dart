import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:rxdart/rxdart.dart';

// todo: refactor with similar pleroma chat class
class ConversationChatCurrentBloc extends DisposableOwner
    implements IConversationChatCurrentBloc {
  final List<IConversationChat?> openedChats = [];

  BehaviorSubject<IConversationChat?> currentChatSubject = BehaviorSubject();

  ConversationChatCurrentBloc() {
    currentChatSubject.disposeWith(this);
  }

  @override
  IConversationChat? get currentChat => currentChatSubject.valueOrNull;

  @override
  Stream<IConversationChat?> get currentChatStream => currentChatSubject.stream;

  @override
  void onChatOpened(IConversationChat? chat) {
    currentChatSubject.add(chat);
    openedChats.add(chat);
  }

  @override
  void onChatClosed(IConversationChat? chat) {
    var indexToRemove = openedChats.lastIndexWhere(
      (currentChat) => currentChat!.remoteId == chat!.remoteId,
    );

    if (indexToRemove >= 0) {
      openedChats.removeAt(indexToRemove);
    }
    if (openedChats.isNotEmpty) {
      currentChatSubject.add(openedChats.last);
    } else {
      currentChatSubject.add(null);
    }
  }
}
