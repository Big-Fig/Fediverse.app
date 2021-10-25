import 'package:fedi_app/app/ui/settings/ui_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUiSettingsLocalPreferenceBloc
    implements ILocalPreferenceBloc<UiSettings> {
  static IUiSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUiSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
