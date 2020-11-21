import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentFediUiThemeValueFormFieldBloc
    implements IValueFormFieldBloc<IFediUiTheme> {
  static ICurrentFediUiThemeValueFormFieldBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentFediUiThemeValueFormFieldBloc>(context, listen: listen);
}
