import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/nested_scroll_controller_bloc_impl.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

class TimelinesHomeTabBloc extends DisposableOwner
    implements ITimelinesHomeTabBloc {
  @override
  NestedScrollController nestedScrollController;

  @override
  INestedScrollControllerBloc nestedScrollControllerBloc;

  @override
  IFediSliverAppBarBloc fediSliverAppBarBloc;

  TimelinesHomeTabBloc() {
    nestedScrollController = NestedScrollController(centerScroll: false);
    fediSliverAppBarBloc = FediSliverAppBarBloc();

    nestedScrollControllerBloc =
        NestedScrollControllerBloc(nestedScrollController: nestedScrollController);

    addDisposable(scrollController: nestedScrollController);
    addDisposable(disposable: nestedScrollControllerBloc);
    addDisposable(disposable: fediSliverAppBarBloc);
  }

  @override
  void scrollToTop() {
    nestedScrollControllerBloc.scrollToTop();
  }
}
