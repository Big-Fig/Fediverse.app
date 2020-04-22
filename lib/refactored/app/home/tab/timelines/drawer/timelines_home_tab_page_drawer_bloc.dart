import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabPageDrawerBloc extends Disposable {
  static ITimelinesHomeTabPageDrawerBloc of(BuildContext context,
          {listen: true}) =>
      Provider.of<ITimelinesHomeTabPageDrawerBloc>(context, listen: listen);

  bool get onlyNoReplies;

  Stream<bool> get onlyNoRepliesStream;

  changeOnlyNoReplies(bool value);

  bool get onlyWithMedia;

  Stream<bool> get onlyWithMediaStream;

  changeOnlyWithMedia(bool value);

  bool get onlyNoNsfwSensitive;

  Stream<bool> get onlyNoNsfwSensitiveStream;

  changeOnlyNoNsfwSensitive(bool value);
}
