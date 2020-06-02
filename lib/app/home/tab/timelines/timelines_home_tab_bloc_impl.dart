import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc_impl.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/widgets.dart';

class TimelinesHomeTabBloc extends DisposableOwner
    implements ITimelinesHomeTabBloc {
  @override
  ScrollController scrollController;

  @override
  ScrollDirectionDetector scrollDirectionDetector;

  TimelinesHomeTabBloc() {
    scrollController = ScrollController();

    scrollDirectionDetector =
        ScrollDirectionDetector(scrollController: scrollController);

    addDisposable(scrollController: scrollController);
    addDisposable(disposable: scrollDirectionDetector);
  }

  @override
  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
