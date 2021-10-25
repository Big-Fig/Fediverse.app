import 'package:fedi_app/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi_app/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';

abstract class IUiSettingsFontSizeSingleFromListValueFormFieldBloc
    implements ISingleSelectFromListValueFormFieldBloc<UiSettingsFontSize> {
  static const UiSettingsFontSize defaultValue =
      IUiSettingsBloc.defaultStatusFontSettingsValue;
}
