import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_bloc_impl.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_id_local_preference_bloc.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class CurrentFediUiThemeBloc extends CurrentUiThemeBloc<IFediUiTheme>
    implements ICurrentFediUiThemeBloc {
  final IUiThemeSystemBrightnessBloc systemBrightnessHandlerBloc;

  CurrentFediUiThemeBloc({
    @required
        ICurrentUiThemeIdLocalPreferenceBloc
            currentUiThemeIdLocalPreferenceBloc,
    @required IFediUiTheme lightTheme,
    @required IFediUiTheme darkTheme,
    @required this.systemBrightnessHandlerBloc,
  }) : super(
          currentUiThemeIdLocalPreferenceBloc:
              currentUiThemeIdLocalPreferenceBloc,
          availableThemes: [
            lightTheme,
            darkTheme,
          ],
        );

  @override
  IFediUiTheme get adaptiveBrightnessCurrentTheme {
    return _calculateAdaptiveBrightnessCurrentThemeStream(
        super.currentTheme, systemBrightnessHandlerBloc.systemBrightness);
  }

  @override
  Stream<IFediUiTheme> get adaptiveBrightnessCurrentThemeStream {
    return Rx.combineLatest2(
        currentThemeStream,
        systemBrightnessHandlerBloc.systemBrightnessStream,
        (currentTheme, systemBrightness) =>
            _calculateAdaptiveBrightnessCurrentThemeStream(
                currentTheme, systemBrightness)).distinct();
  }

  IFediUiTheme _calculateAdaptiveBrightnessCurrentThemeStream(
      IFediUiTheme currentTheme, Brightness systemBrightness) {
    if (currentTheme != null) {
      return currentTheme;
    } else {
      if (systemBrightness == null) {
        return null;
      }
      if (systemBrightness == Brightness.dark) {
        return darkFediUiTheme;
      } else {
        return lightFediUiTheme;
      }
    }
  }
}
