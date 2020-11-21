import 'package:fedi/app/settings/global/edit/edit_global_settings_bloc_impl.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditUiSettingsBloc extends EditGlobalSettingsBloc<UiSettings>
    implements IEditUiSettingsBloc {
  final IUiSettingsBloc uiSettingBloc;

  @override
  final IStringValueFormFieldBloc themeIdFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        themeIdFieldBloc,
      ];

  EditUiSettingsBloc({
    @required this.uiSettingBloc,
    @required bool enabled,
  })  : themeIdFieldBloc = StringValueFormFieldBloc(
          originValue: uiSettingBloc.themeId,
          validators: [],
          maxLength: null,
        ),
        super(enabled, uiSettingBloc) {
    addDisposable(disposable: themeIdFieldBloc);
  }

  @override
  UiSettings calculateCurrentFormFieldsSettings() => UiSettings(
        themeId: themeIdFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(UiSettings settings) async {
    themeIdFieldBloc.changeCurrentValue(
      settings.themeId,
    );
  }
}
