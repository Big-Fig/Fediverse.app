import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabPageDrawerBloc extends Disposable {
  static ITimelinesHomeTabPageDrawerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabPageDrawerBloc>(context, listen: listen);

  bool get onlyNoReplies;

  Stream<bool> get onlyNoRepliesStream;

  void changeOnlyNoReplies(bool value);

  bool get onlyWithMedia;

  Stream<bool> get onlyWithMediaStream;

  void changeOnlyWithMedia(bool value);

  bool get onlyNoNsfwSensitive;

  Stream<bool> get onlyNoNsfwSensitiveStream;

  void changeOnlyNoNsfwSensitive(bool value);
}
