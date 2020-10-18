import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/ui/theme/dark_light_switch_fedi_ui_theme_bloc.dart';
import 'package:flutter/widgets.dart';

class DarkLightSwitchFediUiThemeFormRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var darkLightSwitchFediUiThemeBloc =
        IDarkLightSwitchFediUiThemeBloc.of(context, listen: false);

    return FormBoolFieldFormRowWidget(
      field: darkLightSwitchFediUiThemeBloc,
      label: "app.theme.dark_light_switch.label".tr(),
    );
  }
}
