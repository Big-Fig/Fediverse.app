import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediSliverAppBarBloc extends Disposable {
  static IFediSliverAppBarBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFediSliverAppBarBloc>(context, listen: listen);

  bool get isAtLeastStartExpand;
  Stream<bool> get isAtLeastStartExpandStream;

  void onBuild(
      {@required double minExtent,
      @required double maxExtent,
      @required double shrinkOffset,
      @required bool overlapsContent}) {

  }
}
