import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('fedi_nested_scroll_view_bloc_impl.dart');

class FediNestedScrollViewBloc extends DisposableOwner
    implements IFediNestedScrollViewBloc {
  @override
  final INestedScrollControllerBloc nestedScrollControllerBloc;

  BehaviorSubject<bool> isNestedScrollViewBodyStartedScrollSubject =
      BehaviorSubject();
  BehaviorSubject<int> scrollOffsetSubject = BehaviorSubject();

  ScrollController? get scrollController =>
      nestedScrollControllerBloc.nestedScrollController;

  @override
  bool get isNestedScrollViewBodyStartedScroll =>
      isNestedScrollViewBodyStartedScrollSubject.value;

  @override
  Stream<bool> get isNestedScrollViewBodyStartedScrollStream =>
      isNestedScrollViewBodyStartedScrollSubject.stream.distinct();

  @override
  bool get isNestedScrollViewBodyNotStartedScroll =>
      !isNestedScrollViewBodyStartedScroll;

  @override
  Stream<bool> get isNestedScrollViewBodyNotStartedScrollStream =>
      isNestedScrollViewBodyStartedScrollStream.map(
        (isNestedScrollViewBodyStartedScroll) =>
            !isNestedScrollViewBodyStartedScroll,
      );

  @override
  int? get scrollOffset => scrollOffsetSubject.valueOrNull;

  @override
  Stream<int> get scrollOffsetStream => scrollOffsetSubject.stream.distinct();

  FediNestedScrollViewBloc({
    required this.nestedScrollControllerBloc,
  }) {
    isNestedScrollViewBodyStartedScrollSubject.disposeWith(this);
    scrollOffsetSubject.disposeWith(this);

    void listener() {
      try {
        onScroll();
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(() => 'failed to onScroll', e, stackTrace);
      }
    }

    scrollController!.addListener(listener);

    addCustomDisposable(
      () {
        try {
          scrollController!.removeListener(listener);
          // ignore: avoid_catches_without_on_clauses
        } catch (e) {
          _logger.warning(
            // ignore: missing_whitespace_between_adjacent_strings
            () => 'failed to unsubscribe scrollController'
                '.removeListener(listener);',
          );
        }
      },
    );
  }

  void onScroll() {
    var pixels = scrollController!.position.pixels;
    var maxScrollExtent = scrollController!.position.maxScrollExtent;

    if (!scrollOffsetSubject.isClosed) {
      scrollOffsetSubject.add(pixels.toInt());
    }

    // -1 is hack, because scroll extent sometimes invalid
    // it should be equal to maxScrollExtent when nested scroll body start
    // scrolls but actually it is a little smaller (0.00001 difference)
    maxScrollExtent = maxScrollExtent - 1;
    var isAtLeastStartExpand = pixels <= maxScrollExtent;
    if (!isNestedScrollViewBodyStartedScrollSubject.isClosed) {
      isNestedScrollViewBodyStartedScrollSubject.add(isAtLeastStartExpand);
    }
  }

  @override
  NestedScrollController? get nestedScrollController =>
      nestedScrollControllerBloc.nestedScrollController;
}
