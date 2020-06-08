import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("fedi_sliver_app_bar_bloc_impl.dart");

class FediSliverAppBarBloc extends DisposableOwner
    implements IFediSliverAppBarBloc {
  BehaviorSubject<bool> isAtLeastStartExpandSubject = BehaviorSubject();
  final NestedScrollController scrollController;
  final double deviceHeight;

  @override
  bool get isAtLeastStartExpand => isAtLeastStartExpandSubject.value;
  @override
  Stream<bool> get isAtLeastStartExpandStream =>
      isAtLeastStartExpandSubject.stream;

  FediSliverAppBarBloc({
    @required this.scrollController,
    @required this.deviceHeight,
  }) {
    addDisposable(subject: isAtLeastStartExpandSubject);

    var listener = () {
      var isScrolledAtLeastOneScreen =
          scrollController.totalOffset > deviceHeight / 2;
      _logger.finest(() => "offset: ${scrollController.offset} \n"
          "\t innerOffset: ${scrollController.innerOffset} \n"
          "\t totalOffset: ${scrollController.totalOffset} \n"
          "\t isScrolledAtLeastOneScreen: ${isScrolledAtLeastOneScreen} \n");
      if (isScrolledAtLeastOneScreen) {
        isAtLeastStartExpandSubject.add(false);
      } else {
        isAtLeastStartExpandSubject.add(true);
      }
    };
    scrollController.addListener(listener);

    addDisposable(custom: () {
      scrollController.removeListener(listener);
    });
  }

  @override
  void onBuild(
      {@required double minExtent,
      @required double maxExtent,
      @required double shrinkOffset,
      @required bool overlapsContent}) {
    if (shrinkOffset <= maxExtent - 10) {
      isAtLeastStartExpandSubject.add(true);
    } else {
      isAtLeastStartExpandSubject.add(false);
    }
  }
}
