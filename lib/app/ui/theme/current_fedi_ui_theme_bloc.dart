import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentFediUiThemeBloc
    extends ICurrentUiThemeBloc<IFediUiTheme> {
  static ICurrentFediUiThemeBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentFediUiThemeBloc>(context, listen: listen);
}
