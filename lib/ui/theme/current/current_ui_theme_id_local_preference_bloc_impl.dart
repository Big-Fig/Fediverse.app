import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_id_local_preference_bloc.dart';

class CurrentUiThemeIdLocalPreferenceBloc extends StringLocalPreferenceBloc
    implements ICurrentUiThemeIdLocalPreferenceBloc {
  CurrentUiThemeIdLocalPreferenceBloc(
      ILocalPreferencesService preferenceService)
      : super(preferenceService, "ui.theme.current");
}
