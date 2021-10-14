import 'package:fedi/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi/app/settings/instance/instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementSettingsBloc
    implements IInstanceSettingsBloc<InstanceAnnouncementSettings> {
  static IInstanceAnnouncementSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementSettingsBloc>(context, listen: listen);

  bool get withDismissed;

  Stream<bool> get withDismissedStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeWithDismissed(bool value);
}
