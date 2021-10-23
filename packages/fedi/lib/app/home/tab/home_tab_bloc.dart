import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IHomeTabBloc extends DisposableOwner {
  static IHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IHomeTabBloc>(context, listen: listen);

  ScrollController get nestedScrollController;

  INestedScrollControllerBloc get nestedScrollControllerBloc;

  IFediNestedScrollViewBloc get fediNestedScrollViewBloc;

  void scrollToTop();
}
