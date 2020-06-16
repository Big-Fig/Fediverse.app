import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';
import 'package:provider/provider.dart';

abstract class INestedScrollControllerBloc extends IScrollControllerBloc {
  NestedScrollController get nestedScrollController;

  static INestedScrollControllerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INestedScrollControllerBloc>(context, listen: listen);
}
