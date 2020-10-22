import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentFediUiThemeChooserBloc
    implements IFormValueFieldBloc<IFediUiTheme> {
  static ICurrentFediUiThemeChooserBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentFediUiThemeChooserBloc>(context, listen: listen);
}
