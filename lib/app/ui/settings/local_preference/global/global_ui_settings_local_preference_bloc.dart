import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalUiSettingsLocalPreferenceBloc
    implements IUiSettingsLocalPreferenceBloc {
  static IGlobalUiSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalUiSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
