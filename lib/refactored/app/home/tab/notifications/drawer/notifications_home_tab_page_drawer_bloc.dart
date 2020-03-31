import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationsHomeTabPageDrawerBloc extends Disposable {

  static INotificationsHomeTabPageDrawerBloc of(BuildContext context, {listen: true}) =>
      Provider.of<INotificationsHomeTabPageDrawerBloc>(context, listen: listen);

//
//  bool get onlyNoReplies;
//
//  Stream<bool> get onlyNoRepliesStream;
//
//  changeOnlyNoReplies(bool value);
//
//  bool get onlyWithMedia;
//
//  Stream<bool> get onlyWithMediaStream;
//  changeOnlyWithMedia(bool value);
//
//  bool get onlyNoNsfwSensitive;
//
//  Stream<bool> get onlyNoNsfwSensitiveStream;
//
//  changeOnlyNoNsfwSensitive(bool value);
}
