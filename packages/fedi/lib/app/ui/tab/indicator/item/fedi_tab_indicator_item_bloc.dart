import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediTabIndicatorItemBloc<T> implements IDisposable {
  static IFediTabIndicatorItemBloc<T> of<T>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFediTabIndicatorItemBloc<T>>(context, listen: listen);

  int get index;

  T get item;

  bool get isSelected;

  Stream<bool> get isSelectedStream;

  void select();
}
