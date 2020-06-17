import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';
import 'package:provider/provider.dart';

abstract class IFediNestedScrollViewBloc extends Disposable {
  static IFediNestedScrollViewBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IFediNestedScrollViewBloc>(context, listen: listen);

  INestedScrollControllerBloc nestedScrollControllerBloc;

  NestedScrollController get nestedScrollController;

  bool get isNestedScrollViewBodyStartScroll;

  Stream<bool> get isNestedScrollViewBodyStartScrollStream;

  int get scrollOffset;

  Stream<int> get scrollOffsetStream;
}
