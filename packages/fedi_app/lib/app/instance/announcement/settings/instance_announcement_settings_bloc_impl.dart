import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_bloc.dart';
import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi_app/app/instance/announcement/settings/local_preferences/instance_announcement_settings_local_preference_bloc.dart';
import 'package:logging/logging.dart';

final _logger = Logger('instanceAnnouncement_settings_bloc_impl.dart');

class InstanceAnnouncementSettingsBloc extends DisposableOwner
    implements IInstanceAnnouncementSettingsBloc {
  final IInstanceAnnouncementSettingsLocalPreferenceBloc<
      InstanceAnnouncementSettings> instanceLocalPreferencesBloc;

  InstanceAnnouncementSettingsBloc({
    required this.instanceLocalPreferencesBloc,
  });

  @override
  InstanceAnnouncementSettings get settingsData =>
      instanceLocalPreferencesBloc.value;

  @override
  Stream<InstanceAnnouncementSettings> get settingsDataStream =>
      instanceLocalPreferencesBloc.stream;

  @override
  Future<void> changeWithDismissed(bool value) => updateSettings(
        settingsData.copyWith(
          withDismissed: value,
        ),
      );

  @override
  bool get withDismissed => settingsData.withDismissed;

  @override
  Stream<bool> get withDismissedStream =>
      settingsDataStream.map((settings) => settings.withDismissed);

  @override
  Future<void> updateSettings(InstanceAnnouncementSettings newSettings) async {
    if (settingsData == newSettings) {
      _logger.finest(() => 'Same settings');

      return;
    }

    await instanceLocalPreferencesBloc.setValue(newSettings);
  }
}
