import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediMediaCarouselBloc<T> implements IDisposable {
  static IFediMediaCarouselBloc of<T>(BuildContext context,
      {bool listen = true}) =>
      Provider.of<IFediMediaCarouselBloc<T>>(context, listen: listen);
  List<T> get items;
  int? get currentIndex;
  Stream<int> get currentIndexStream;

  void selectIndex(int index);
}
