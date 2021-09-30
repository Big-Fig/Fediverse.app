import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatSelectionItemBloc implements IDisposable {
  static IChatSelectionItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IChatSelectionItemBloc>(context, listen: listen);

  IChatSelectionBloc get chatSelectionBloc;

  IChatMessage get chatMessage;

  bool get isSelected;

  Stream<bool> get isSelectedStream;

  void toggleSelection();

  void unSelect();

  void select();

  bool? get isSelectionPossible;

  Stream<bool> get isSelectionPossibleStream;

  void changeSelectionPossible(bool isSelectionPossible);
}
