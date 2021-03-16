import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatSelectionItemBloc implements IDisposable {
  static IChatSelectionItemBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatSelectionItemBloc>(context, listen: listen);

  bool get isSelected;

  Stream<bool> get isSelectedStream;

  void toggleSelection();

  void unSelect();

  void select();

  bool? get isSelectionPossible;

  Stream<bool> get isSelectionPossibleStream;

  void changeSelectionPossible(bool isSelectionPossible);
}
