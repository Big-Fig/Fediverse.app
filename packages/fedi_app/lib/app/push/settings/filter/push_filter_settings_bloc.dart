import 'package:fedi_app/app/push/settings/filter/push_filter_settings_model.dart';
import 'package:fedi_app/app/settings/instance/instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushFilterSettingsBloc
    implements IInstanceSettingsBloc<PushFilterSettings> {
  static IPushFilterSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushFilterSettingsBloc>(context, listen: listen);

  bool get isMyAccountNotificationSettingsSupported;

  bool get hideNotificationContents;

  Stream<bool> get hideNotificationContentsStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeHideNotificationContents(bool value);

  bool get blockFromStrangers;

  Stream<bool> get blockFromStrangersStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeBlockFromStrangers(bool value);
}
