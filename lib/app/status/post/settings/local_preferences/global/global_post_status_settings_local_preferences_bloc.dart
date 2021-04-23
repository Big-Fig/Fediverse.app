import 'package:fedi/app/status/post/settings/local_preferences/post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalPostStatusSettingsLocalPreferencesBloc
    implements IPostStatusSettingsLocalPreferencesBloc<PostStatusSettings> {
  static IGlobalPostStatusSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalPostStatusSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
