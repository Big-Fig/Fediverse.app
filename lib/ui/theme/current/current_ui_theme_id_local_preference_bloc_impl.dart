import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_id_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';

class CurrentUiThemeIdLocalPreferenceBloc extends StringLocalPreferenceBloc
    implements ICurrentUiThemeIdLocalPreferenceBloc {
  @override
  final String defaultValue;

  CurrentUiThemeIdLocalPreferenceBloc(
    ILocalPreferencesService preferenceService, {
    @required this.defaultValue,
  }) : super(preferenceService, "ui.theme.current");
}
