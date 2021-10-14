import 'package:fedi/app/ui/settings/edit/edit_ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_widget_keys.dart';
import 'package:fedi/app/ui/settings/font_size/form/ui_settings_font_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/ui/settings/font_size/form/ui_settings_font_size_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditUiSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditUiSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditUiSettingsThemeFieldWidget(),
          _EditUiSettingsStatusFontSizeFieldWidget(),
        ],
      );
}

class _EditUiSettingsStatusFontSizeFieldWidget extends StatelessWidget {
  const _EditUiSettingsStatusFontSizeFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IEditUiSettingsBloc,
          IUiSettingsFontSizeSingleFromListValueFormFieldBloc>(
        update: (context, value, previous) => value.statusFontSizeBloc,
        child: const UiSettingsFontSizeSingleFromListValueFormFieldRowWidget(),
      );
}

class _EditUiSettingsThemeFieldWidget extends StatelessWidget {
  const _EditUiSettingsThemeFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IEditUiSettingsBloc,
          IFediUiThemeSingleFromListValueFormFieldBloc>(
        update: (context, value, previous) => value.fediThemeFieldBloc,
        child: const FediUiThemeSingleFromListValueFormFieldRowWidget(
          key: Key(
            EditUiSettingsWidgetKeys
                .fediUiThemeSingleFromListValueFormFieldRowWidget,
          ),
        ),
      );
}
