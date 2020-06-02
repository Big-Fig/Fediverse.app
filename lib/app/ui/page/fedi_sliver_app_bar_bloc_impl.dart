import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FediSliverAppBarBloc extends DisposableOwner
    implements IFediSliverAppBarBloc {
  BehaviorSubject<bool> isAtLeastStartExpandSubject = BehaviorSubject();

  @override
  bool get isAtLeastStartExpand => isAtLeastStartExpandSubject.value;
  @override
  Stream<bool> get isAtLeastStartExpandStream =>
      isAtLeastStartExpandSubject.stream;

  FediSliverAppBarBloc() {
    addDisposable(subject: isAtLeastStartExpandSubject);
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
