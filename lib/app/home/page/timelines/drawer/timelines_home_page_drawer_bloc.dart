import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomePageDrawerBloc {

  static ITimelinesHomePageDrawerBloc of(BuildContext context, {listen: true}) =>
      Provider.of<ITimelinesHomePageDrawerBloc>(context, listen: listen);


  bool get noReplies;

  Stream<bool> get noRepliesStream;

  changeNoReplies(bool value);

  bool get onlyMedia;

  Stream<bool> get onlyMediaStream;
  changeOnlyMedia(bool value);

  bool get noNsfwSensitive;

  Stream<bool> get noNsfwSensitiveStream;

  changeNoNsfwSensitive(bool value);
}
