import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementSettingsLocalPreferenceBloc<
    T extends InstanceAnnouncementSettings?> implements LocalPreferenceBloc<T> {
  static IInstanceAnnouncementSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
