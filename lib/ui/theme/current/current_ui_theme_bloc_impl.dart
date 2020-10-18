import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_bloc.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_id_local_preference_bloc.dart';
import 'package:fedi/ui/theme/ui_theme_model.dart';
import 'package:flutter/widgets.dart';

class CurrentUiThemeBloc<T extends IUiTheme> extends DisposableOwner
    implements ICurrentUiThemeBloc<T> {
  final ICurrentUiThemeIdLocalPreferenceBloc
      currentUiThemeIdLocalPreferenceBloc;
  final List<T> availableThemes;
  final T defaultTheme;

  CurrentUiThemeBloc({
    @required this.currentUiThemeIdLocalPreferenceBloc,
    @required this.availableThemes,
    @required this.defaultTheme,
  });

  @override
  T get currentTheme =>
      mapIdToTheme(currentUiThemeIdLocalPreferenceBloc.value) ?? defaultTheme;

  @override
  Stream<T> get currentThemeStream =>
      currentUiThemeIdLocalPreferenceBloc.stream.map((currentUiThemeId) =>
          mapIdToTheme(currentUiThemeIdLocalPreferenceBloc.value) ??
          defaultTheme);

  T mapIdToTheme(String id) {
    if (id == null) {
      return null;
    }

    return availableThemes.firstWhere(
      (theme) => theme.id == id,
    );
  }

  @override
  Future changeTheme(T theme) async {
    var newId = theme.id;
    if (currentUiThemeIdLocalPreferenceBloc.value != newId) {
      await currentUiThemeIdLocalPreferenceBloc.setValue(newId);
    }
  }
}
