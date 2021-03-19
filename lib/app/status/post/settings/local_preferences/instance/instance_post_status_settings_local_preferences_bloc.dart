import 'package:fedi/app/status/post/settings/local_preferences/post_status_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstancePostStatusSettingsLocalPreferencesBloc
    implements IPostStatusSettingsLocalPreferencesBloc {
  static IInstancePostStatusSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstancePostStatusSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
