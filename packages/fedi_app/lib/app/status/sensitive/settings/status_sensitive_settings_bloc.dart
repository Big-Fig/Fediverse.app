import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_model.dart';
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
  Future<void> changeIsAlwaysShowSpoiler(bool value);

  bool get isNeedReplaceBlurWithFill;

  Stream<bool> get isNeedReplaceBlurWithFillStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeIsNeedReplaceBlurWithFill(bool value);

  bool get isAlwaysShowNsfw;

  Stream<bool> get isAlwaysShowNsfwStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeIsAlwaysShowNsfw(bool value);

  Duration? get nsfwDisplayDelayDuration;

  Stream<Duration?> get nsfwDisplayDelayDurationStream;

  Future<void> changeNsfwDisplayDelayDuration(Duration? value);
}
