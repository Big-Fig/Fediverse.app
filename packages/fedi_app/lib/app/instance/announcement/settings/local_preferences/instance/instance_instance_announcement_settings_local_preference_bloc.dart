import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi_app/app/instance/announcement/settings/local_preferences/instance_announcement_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceInstanceAnnouncementSettingsLocalPreferenceBloc
    implements
        IInstanceAnnouncementSettingsLocalPreferenceBloc<
            InstanceAnnouncementSettings> {
  static IInstanceAnnouncementSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
