import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabBloc extends DisposableOwner {
  static ITimelinesHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabBloc>(context, listen: listen);


  ScrollController get scrollController;

  ScrollDirectionDetector get scrollDirectionDetector;

  void scrollToTop();
}
