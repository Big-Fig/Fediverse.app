import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusSensitiveSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<StatusSensitiveSettings> {
  static IStatusSensitiveSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusSensitiveSettingsBloc>(context, listen: listen);

  bool get isAlwaysShowSpoiler;

  Stream<bool> get isAlwaysShowSpoilerStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeIsAlwaysShowSpoiler(bool value);

  bool get isNeedReplaceBlurWithFill;

  Stream<bool> get isNeedReplaceBlurWithFillStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeIsNeedReplaceBlurWithFill(bool value);

  bool get isAlwaysShowNsfw;

  Stream<bool> get isAlwaysShowNsfwStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeIsAlwaysShowNsfw(bool value);

  Duration? get nsfwDisplayDelayDuration;

  Stream<Duration?> get nsfwDisplayDelayDurationStream;

  Future changeNsfwDisplayDelayDuration(Duration? value);
}
