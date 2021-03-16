import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ChatSelectionItemBloc extends DisposableOwner
    implements IChatSelectionItemBloc {
  final IChatSelectionBloc chatSelectionBloc;
  final IChatMessage? chatMessage;

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
    addDisposable(subject: isSelectionPossibleSubject);
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

  static ChatSelectionItemBloc createFromContext(
    BuildContext context, {
    required IChatMessage chatMessage,
    required bool isSelectionPossible,
  }) {
    var chatSelectionBloc = IChatSelectionBloc.of(
      context,
      listen: false,
    );
    return ChatSelectionItemBloc(
      chatSelectionBloc: chatSelectionBloc,
      chatMessage: chatMessage,
      isSelectionPossible: isSelectionPossible,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IChatMessage chatMessage,
    required bool isSelectionPossible,
  }) =>
      DisposableProvider<IChatSelectionItemBloc>(
        create: (context) => ChatSelectionItemBloc.createFromContext(
          context,
          chatMessage: chatMessage,
          isSelectionPossible: isSelectionPossible,
        ),
        child: child,
      );
}
