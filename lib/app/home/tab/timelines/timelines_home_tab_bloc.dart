import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabBloc extends DisposableOwner {
  static ITimelinesHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabBloc>(context, listen: listen);

  ScrollController get scrollController;

  IScrollControllerBloc get scrollControllerBloc;
  IFediSliverAppBarBloc get fediSliverAppBarBloc;

  void scrollToTop();
}
