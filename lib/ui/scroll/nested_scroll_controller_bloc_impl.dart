import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

class NestedScrollControllerBloc extends ScrollControllerBloc
    implements INestedScrollControllerBloc {
  @override
  final NestedScrollController nestedScrollController;

  NestedScrollControllerBloc({required this.nestedScrollController})
      : super(scrollController: nestedScrollController);
}
