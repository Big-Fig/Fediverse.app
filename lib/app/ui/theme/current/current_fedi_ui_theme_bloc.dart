import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentFediUiThemeBloc implements IDisposable {
  static ICurrentFediUiThemeBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentFediUiThemeBloc>(context, listen: listen);

  IFediUiTheme? get adaptiveBrightnessCurrentTheme;

  Stream<IFediUiTheme?> get adaptiveBrightnessCurrentThemeStream;

  IFediUiTheme? get currentTheme;

  Stream<IFediUiTheme?> get currentThemeStream;

  Future changeTheme(IFediUiTheme theme);
}
