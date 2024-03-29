import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';
import 'package:provider/provider.dart';

abstract class IFediNestedScrollViewBloc extends IDisposable {
  static IFediNestedScrollViewBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFediNestedScrollViewBloc>(context, listen: listen);

  INestedScrollControllerBloc get nestedScrollControllerBloc;

  NestedScrollController? get nestedScrollController;

  bool? get isNestedScrollViewBodyStartedScroll;

  Stream<bool> get isNestedScrollViewBodyStartedScrollStream;

  bool get isNestedScrollViewBodyNotStartedScroll;

  Stream<bool> get isNestedScrollViewBodyNotStartedScrollStream;

  int? get scrollOffset;

  Stream<int> get scrollOffsetStream;
}
