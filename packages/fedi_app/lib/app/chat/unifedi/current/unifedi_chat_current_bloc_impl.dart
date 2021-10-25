import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/unifedi/current/unifedi_chat_current_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:rxdart/rxdart.dart';

// todo: refactor with similar conversation chat class
class UnifediChatCurrentBloc extends DisposableOwner
    implements IUnifediChatCurrentBloc {
  final List<IUnifediChat?> openedChats = [];

  BehaviorSubject<IUnifediChat?> currentChatSubject = BehaviorSubject();

  UnifediChatCurrentBloc() {
    currentChatSubject.disposeWith(this);
  }

  @override
  IUnifediChat? get currentChat => currentChatSubject.valueOrNull;

  @override
  Stream<IUnifediChat?> get currentChatStream => currentChatSubject.stream;

  @override
  void onChatOpened(IUnifediChat? chat) {
    currentChatSubject.add(chat);
    openedChats.add(chat);
  }

  @override
  void onChatClosed(IUnifediChat? chat) {
    var indexToRemove = openedChats.lastIndexWhere(
      (currentChat) => currentChat!.remoteId == chat!.remoteId,
    );

    if (indexToRemove >= 0) {
      // ignore: avoid-ignoring-return-values
      openedChats.removeAt(indexToRemove);
    }
    if (openedChats.isNotEmpty) {
      currentChatSubject.add(openedChats.last);
    } else {
      currentChatSubject.add(null);
    }
  }
}
