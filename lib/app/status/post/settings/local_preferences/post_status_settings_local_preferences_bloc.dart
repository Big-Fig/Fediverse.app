import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusSettingsLocalPreferencesBloc
    implements ILocalPreferenceBloc<PostStatusSettings> {
  static IPostStatusSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPostStatusSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
