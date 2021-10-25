import 'package:fedi_app/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/dark/dark_fedi_ui_theme_model.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class FediUiThemeSingleFromListValueFormFieldRowWidget extends StatelessWidget {
  const FediUiThemeSingleFromListValueFormFieldRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      FediUiThemeSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<IFediUiTheme?>(
          label: S.of(context).app_theme_chooser_label,
          valueTitleMapper: _mapThemeToTitle,
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: _mapThemeToIcon,
          valueKeyMapper: (context, IFediUiTheme? value) =>
              value != null ? Key(value.id) : null,
        ),
      );
}

String _mapThemeToTitle(BuildContext context, IFediUiTheme? theme) {
  if (theme == null) {
    return S.of(context).app_theme_type_system;
  } else if (theme == lightFediUiTheme) {
    return S.of(context).app_theme_type_light;
  } else if (theme == darkFediUiTheme) {
    return S.of(context).app_theme_type_dark;
  } else {
    throw ArgumentError('unsupported theme $theme');
  }
}

IconData _mapThemeToIcon(BuildContext context, IFediUiTheme? theme) {
  if (theme == null) {
    return FediIcons.appearance_auto;
  } else if (theme == lightFediUiTheme) {
    return FediIcons.appearance_light;
  } else if (theme == darkFediUiTheme) {
    return FediIcons.appearance_dark;
  } else {
    throw ArgumentError('unsupported theme $theme');
  }
}
