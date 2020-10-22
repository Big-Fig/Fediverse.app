import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_bloc_impl.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_id_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';

class CurrentFediUiThemeBloc extends CurrentUiThemeBloc<IFediUiTheme>
    implements ICurrentFediUiThemeBloc {
  CurrentFediUiThemeBloc({
    @required
        ICurrentUiThemeIdLocalPreferenceBloc
            currentUiThemeIdLocalPreferenceBloc,
    @required List<IFediUiTheme> availableThemes,
    @required IFediUiTheme defaultTheme,
  }) : super(
          currentUiThemeIdLocalPreferenceBloc:
              currentUiThemeIdLocalPreferenceBloc,
          availableThemes: availableThemes,
          defaultTheme: defaultTheme,
        );


}
