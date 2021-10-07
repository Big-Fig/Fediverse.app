import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:rxdart/rxdart.dart';

// todo: refactor with similar conversation chat class
class PleromaChatCurrentBloc extends DisposableOwner
    implements IPleromaChatCurrentBloc {
  final List<IPleromaChat?> openedChats = [];

  BehaviorSubject<IPleromaChat?> currentChatSubject = BehaviorSubject();

  PleromaChatCurrentBloc() {
    currentChatSubject.disposeWith(this);
  }

  @override
  IPleromaChat? get currentChat => currentChatSubject.valueOrNull;

  @override
  Stream<IPleromaChat?> get currentChatStream => currentChatSubject.stream;

  @override
  void onChatOpened(IPleromaChat? chat) {
    currentChatSubject.add(chat);
    openedChats.add(chat);
  }

  @override
  void onChatClosed(IPleromaChat? chat) {
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
