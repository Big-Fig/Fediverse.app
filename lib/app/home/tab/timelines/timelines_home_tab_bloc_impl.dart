import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
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

  TimelinesHomeTabBloc() {
    scrollController = ScrollController();

    scrollControllerBloc =
        ScrollControllerBloc(scrollController: scrollController);

    addDisposable(scrollController: scrollController);
    addDisposable(disposable: scrollControllerBloc);
  }

  @override
  void scrollToTop() {
   scrollControllerBloc.scrollToTop();
  }
}
