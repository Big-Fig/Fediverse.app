import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScrollControllerBloc extends IDisposable {
  static IScrollControllerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IScrollControllerBloc>(context, listen: listen);

  // todo: refactor?
  ScrollController? get scrollController;

  bool get scrolledToTop;

  Stream<bool> get scrolledToTopStream;

  ScrollDirection? get scrollDirection;

  Stream<ScrollDirection?> get scrollDirectionStream;

  ScrollDirection? get longScrollDirection;

  Stream<ScrollDirection?> get longScrollDirectionStream;

  void scrollToTop();
}
