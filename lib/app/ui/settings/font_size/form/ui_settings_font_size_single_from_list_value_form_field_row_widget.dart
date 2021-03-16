import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/ui/settings/font_size/form/ui_settings_font_size_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class UiSettingsFontSizeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      UiSettingsFontSizeSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<UiSettingsFontSize>(
          label: S.of(context).app_ui_statusFontSize,
          valueTitleMapper: (context, value) =>
              mapUiSettingsFontSizeToLabel(context, value!),
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );

  const UiSettingsFontSizeSingleFromListValueFormFieldRowWidget();
}

String mapUiSettingsFontSizeToLabel(
    BuildContext context, UiSettingsFontSize type) {
  switch (type) {
    case UiSettingsFontSize.smallest:
      return S.of(context).app_ui_fontSize_type_smallest;
    case UiSettingsFontSize.small:
      return S.of(context).app_ui_fontSize_type_small;
    case UiSettingsFontSize.medium:
      return S.of(context).app_ui_fontSize_type_medium;
    case UiSettingsFontSize.large:
      return S.of(context).app_ui_fontSize_type_large;
    case UiSettingsFontSize.largest:
      return S.of(context).app_ui_fontSize_type_largest;
  }
}
