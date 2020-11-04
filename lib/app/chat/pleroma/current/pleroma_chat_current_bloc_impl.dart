import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';

class PleromaChatCurrentBloc extends DisposableOwner implements IPleromaChatCurrentBloc {
  BehaviorSubject<IPleromaChat> currentChatSubject = BehaviorSubject();

  PleromaChatCurrentBloc() {
    addDisposable(subject: currentChatSubject);
  }

  @override
  IPleromaChat get currentChat => currentChatSubject.value;

  @override
  Stream<IPleromaChat> get currentChatStream => currentChatSubject.stream;

  @override
  void onChatOpened(IPleromaChat chat) {
    assert(currentChat == null);
    currentChatSubject.add(chat);
  }

  @override
  void onChatClosed(IPleromaChat chat) {
    assert(currentChat != null);
    assert(currentChat.remoteId == chat.remoteId);
    currentChatSubject.add(null);
  }
}
