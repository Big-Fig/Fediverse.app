import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/dark/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CurrentFediUiThemeBloc extends DisposableOwner
    implements ICurrentFediUiThemeBloc {
  final IUiThemeSystemBrightnessBloc systemBrightnessHandlerBloc;

  final List<IFediUiTheme> availableThemes;
  final IUiSettingsBloc uiSettingsBloc;

  CurrentFediUiThemeBloc({
    required this.uiSettingsBloc,
    required IFediUiTheme lightTheme,
    required IFediUiTheme darkTheme,
    required this.systemBrightnessHandlerBloc,
    required this.availableThemes,
  });

  @override
  IFediUiTheme? get adaptiveBrightnessCurrentTheme =>
      _calculateAdaptiveBrightnessCurrentThemeStream(
        currentTheme,
        systemBrightnessHandlerBloc.systemBrightness,
      );

  @override
  Stream<IFediUiTheme?> get adaptiveBrightnessCurrentThemeStream {
    return Rx.combineLatest2(
      currentThemeStream,
      systemBrightnessHandlerBloc.systemBrightnessStream,
      (dynamic currentTheme, dynamic systemBrightness) =>
          _calculateAdaptiveBrightnessCurrentThemeStream(
        currentTheme,
        systemBrightness,
      ),
    ).distinct();
  }

  IFediUiTheme? _calculateAdaptiveBrightnessCurrentThemeStream(
    IFediUiTheme? currentTheme,
    Brightness? systemBrightness,
  ) {
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

  @override
  IFediUiTheme? get currentTheme => mapIdToTheme(uiSettingsBloc.themeId);

  @override
  Stream<IFediUiTheme?> get currentThemeStream =>
      uiSettingsBloc.themeIdStream.map(
        (currentUiThemeId) => mapIdToTheme(currentUiThemeId),
      );

  IFediUiTheme? mapIdToTheme(String? id) {
    if (id == null) {
      return null;
    }

    return availableThemes.firstWhere(
      (theme) => theme.id == id,
    );
  }

  @override
  Future changeTheme(IFediUiTheme theme) async {
    var newThemeId = theme.id;
    if (uiSettingsBloc.themeId != newThemeId) {
      await uiSettingsBloc.changeThemeId(newThemeId);
    }
  }
}
