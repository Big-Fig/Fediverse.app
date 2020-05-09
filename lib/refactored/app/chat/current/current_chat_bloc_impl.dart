import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/current/current_chat_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';

class CurrentChatBloc extends DisposableOwner implements ICurrentChatBloc {
  BehaviorSubject<IChat> currentChatSubject = BehaviorSubject();

  CurrentChatBloc() {
    addDisposable(subject: currentChatSubject);
  }

  @override
  IChat get currentChat => currentChatSubject.value;

  @override
  Stream<IChat> get currentChatStream => currentChatSubject.stream;

  @override
  void onChatOpened(IChat chat) {
    assert(currentChat == null);
    currentChatSubject.add(chat);
  }

  @override
  void onChatClosed(IChat chat) {
    assert(currentChat != null);
    assert(currentChat.remoteId == chat.remoteId);
    currentChatSubject.add(null);
  }
}
