import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusSettingsLocalPreferenceBloc<
    T extends PostStatusSettings?> implements ILocalPreferenceBloc<T> {
  static IPostStatusSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPostStatusSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
