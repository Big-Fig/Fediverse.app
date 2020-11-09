import 'package:fedi/app/form/form_fedi_theme_field_form_row_widget.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class CurrentFediUiThemeChooserFormRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentFediUiThemeChooserBloc =
        ICurrentFediUiThemeChooserBloc.of(context);

    return FormFediThemeFieldFormRowWidget(
      field: currentFediUiThemeChooserBloc,
      label: S.of(context).app_theme_chooser_label,
    );
  }

  const CurrentFediUiThemeChooserFormRowWidget();
}
