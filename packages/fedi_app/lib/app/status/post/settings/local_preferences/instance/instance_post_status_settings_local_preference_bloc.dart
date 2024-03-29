import 'package:fedi_app/app/status/post/settings/local_preferences/post_status_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstancePostStatusSettingsLocalPreferenceBloc
    implements IPostStatusSettingsLocalPreferenceBloc<PostStatusSettings?> {
  static IInstancePostStatusSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstancePostStatusSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
