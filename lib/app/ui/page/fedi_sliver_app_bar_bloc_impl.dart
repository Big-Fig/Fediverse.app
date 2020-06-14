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
  BehaviorSubject<int> expandOffsetSubject = BehaviorSubject();
  final NestedScrollController scrollController;
  final double deviceHeight;

  @override
  bool get isAtLeastStartExpand => isAtLeastStartExpandSubject.value;

  @override
  Stream<bool> get isAtLeastStartExpandStream =>
      isAtLeastStartExpandSubject.stream.distinct();

  @override
  int get expandOffset => expandOffsetSubject.value;

  @override
  Stream<int> get expandOffsetStream => expandOffsetSubject.stream.distinct();

  FediSliverAppBarBloc({
    @required this.scrollController,
    @required this.deviceHeight,
  }) {
    addDisposable(subject: isAtLeastStartExpandSubject);
    addDisposable(subject: expandOffsetSubject);

    var listener = () {
      // -1 is hack, because scroll extent sometimes invalid (0.0000...1
      // difference)
      var pixels = scrollController.position.pixels;
      var isAtLeastStartExpand =
          pixels < scrollController.position.maxScrollExtent - 1;

      expandOffsetSubject.add(pixels.toInt());

      _logger.finest(() => "offset: ${scrollController.offset} \n"
              "\t innerOffset: ${scrollController.innerOffset} \n"
              "\t totalOffset: ${scrollController.totalOffset} \n"
              "\t position: ${scrollController.position} \n"
              "\t isAtLeastStartExpand: ${isAtLeastStartExpand} \n"
              "\t scrollController.position.pixels: ${scrollController.position.pixels} scrollController.position.maxScrollExtent ${scrollController.position.maxScrollExtent}"
//          "\t isScrolledAtLeastOneScreen: ${isScrolledAtLeastOneScreen} \n"
          );
      isAtLeastStartExpandSubject.add(isAtLeastStartExpand);
    };
    scrollController.addListener(listener);

    addDisposable(custom: () {
      try {
        scrollController.removeListener(listener);
      } catch (e, stackTrace) {
        _logger.warning(
          () => "failed to unsubscribe scrollController"
              ".removeListener(listener);",
          e,
          stackTrace,
        );
      }
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
