import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll_controller_bloc_impl.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/widgets.dart';

class TimelinesHomeTabBloc extends DisposableOwner
    implements ITimelinesHomeTabBloc {
  @override
  ScrollController scrollController;

  @override
  IScrollControllerBloc scrollControllerBloc;

  @override
  IFediSliverAppBarBloc fediSliverAppBarBloc;

  TimelinesHomeTabBloc() {
    scrollController = ScrollController();
    fediSliverAppBarBloc = FediSliverAppBarBloc();

    scrollControllerBloc =
        ScrollControllerBloc(scrollController: scrollController);

    addDisposable(scrollController: scrollController);
    addDisposable(disposable: scrollControllerBloc);
    addDisposable(disposable: fediSliverAppBarBloc);
  }

  @override
  void scrollToTop() {
   scrollControllerBloc.scrollToTop();
  }
}
