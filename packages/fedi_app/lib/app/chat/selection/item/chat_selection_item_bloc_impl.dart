import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/message/chat_message_model.dart';
import 'package:fedi_app/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi_app/app/chat/selection/item/chat_selection_item_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ChatSelectionItemBloc extends DisposableOwner
    implements IChatSelectionItemBloc {
  @override
  final IChatSelectionBloc chatSelectionBloc;
  @override
  final IChatMessage chatMessage;

  final BehaviorSubject<bool> isSelectionPossibleSubject;

  @override
  bool? get isSelectionPossible => isSelectionPossibleSubject.value;

  @override
  Stream<bool> get isSelectionPossibleStream =>
      isSelectionPossibleSubject.stream;

  @override
  void changeSelectionPossible(bool isSelectionPossible) {
    isSelectionPossibleSubject.add(isSelectionPossible);
  }

  ChatSelectionItemBloc({
    required this.chatSelectionBloc,
    required this.chatMessage,
    required bool isSelectionPossible,
  }) : isSelectionPossibleSubject =
            BehaviorSubject.seeded(isSelectionPossible) {
    isSelectionPossibleSubject.disposeWith(this);
  }

  @override
  bool get isSelected => chatSelectionBloc.isItemSelected(
        chatMessage,
      );

  @override
  Stream<bool> get isSelectedStream => chatSelectionBloc.isItemSelectedStream(
        chatMessage,
      );

  @override
  void select() {
    chatSelectionBloc.addItemToSelection(chatMessage);
  }

  @override
  void toggleSelection() {
    chatSelectionBloc.toggleItemSelected(chatMessage);
  }

  @override
  void unSelect() {
    chatSelectionBloc.removeItemFromSelection(chatMessage);
  }
}
