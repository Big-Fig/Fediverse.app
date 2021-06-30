import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediTabIndicatorBloc<T> implements IDisposable {
  static IFediTabIndicatorBloc of<T>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFediTabIndicatorBloc<T>>(context, listen: listen);

  TabController get tabController;

  List<T> get items;

  T get selectedItem;

  Stream<T> get selectedItemStream;

  int? get selectedIndex;

  Stream<int> get selectedIndexStream;

  void selectIndex(int index);
}
