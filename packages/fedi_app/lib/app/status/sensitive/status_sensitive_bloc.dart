import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/sensitive/status_sensitive_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusSensitiveBloc implements IDisposable {
  static IStatusSensitiveBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusSensitiveBloc>(context, listen: listen);

  bool get isAlwaysShowNsfw;

  bool get isAlwaysShowSpoiler;

  bool get nsfwSensitiveAndDisplayNsfwContentEnabled;

  Stream<bool> get nsfwSensitiveAndDisplayNsfwContentEnabledStream;

  bool get containsSpoilerAndDisplaySpoilerContentEnabled;

  StatusSensitiveWarningState get statusWarningState;

  Stream<StatusSensitiveWarningState> get statusWarningStateStream;

  Stream<bool> get containsSpoilerAndDisplaySpoilerContentEnabledStream;

  void enableDisplay();
}
