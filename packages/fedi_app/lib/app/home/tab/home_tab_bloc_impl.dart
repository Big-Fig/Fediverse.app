import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/home/tab/home_tab_bloc.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_bloc_impl.dart';
import 'package:fedi_app/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi_app/ui/scroll/nested_scroll_controller_bloc_impl.dart';
import 'package:logging/logging.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

var _logger = Logger('home_tab_bloc_impl.dart');

abstract class HomeTabBloc extends DisposableOwner implements IHomeTabBloc {
  @override
  final NestedScrollController nestedScrollController =
      NestedScrollController(centerScroll: false);

  @override
  // ignore: avoid-late-keyword
  late INestedScrollControllerBloc nestedScrollControllerBloc;

  @override
  // ignore: avoid-late-keyword
  late IFediNestedScrollViewBloc fediNestedScrollViewBloc;

  HomeTabBloc() {
    nestedScrollControllerBloc = NestedScrollControllerBloc(
      nestedScrollController: nestedScrollController,
    );
    fediNestedScrollViewBloc = FediNestedScrollViewBloc(
      nestedScrollControllerBloc: nestedScrollControllerBloc,
    );

    addCustomDisposable(
      () {
        try {
          nestedScrollController.dispose();
          // ignore: avoid_catches_without_on_clauses
        } catch (e) {
          _logger
              .warning(() => 'error during nestedScrollController.dispose()');
        }
      },
    );
    addDisposable(nestedScrollControllerBloc);
    addDisposable(fediNestedScrollViewBloc);
  }

  @override
  void scrollToTop() {
    nestedScrollControllerBloc.scrollToTop();
  }
}
