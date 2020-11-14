import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditUiSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditUiSettingsBloc {
  final IUiSettingsBloc uiSettingBloc;

  @override
  final IFormStringFieldBloc themeIdFieldBloc;

  EditUiSettingsBloc({
    @required this.uiSettingBloc,
  }) : themeIdFieldBloc = FormStringFieldBloc(
          originValue: uiSettingBloc.themeId,
          validators: [],
          maxLength: null,
        ) {
    _subscribeForThemeId();
  }

  void _subscribeForThemeId() {
    addDisposable(
      streamSubscription: uiSettingBloc.themeIdStream.distinct().listen(
        (newValue) {
          themeIdFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: themeIdFieldBloc.currentValueStream.listen(
        (value) {
          uiSettingBloc.changeThemeId(value);
        },
      ),
    );
  }
}
