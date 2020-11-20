import 'package:fedi/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_bloc_impl.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditLocalizationSettingsBloc
    extends EditGlobalSettingsBloc<LocalizationSettings>
    implements IEditLocalizationSettingsBloc {
  final ILocalizationSettingsBloc localizationSettingBloc;

  @override
  final IFormValueFieldBloc<LocalizationLocale> localizationLocaleFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        localizationLocaleFieldBloc,
      ];

  EditLocalizationSettingsBloc({
    @required this.localizationSettingBloc,
    @required bool enabled,
  })  : localizationLocaleFieldBloc = FormValueFieldBloc<LocalizationLocale>(
          originValue: localizationSettingBloc.localizationLocale,
          validators: [],
        ),
        super(enabled, localizationSettingBloc) {
    addDisposable(disposable: localizationLocaleFieldBloc);
  }

  @override
  LocalizationSettings get settingsData => localizationSettingBloc.settingsData;

  @override
  Stream<LocalizationSettings> get settingsDataStream =>
      localizationSettingBloc.settingsDataStream;

  @override
  LocalizationSettings calculateCurrentFormFieldsSettings() =>
      LocalizationSettings(
        localizationLocale: localizationLocaleFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(LocalizationSettings settings) async {
    localizationLocaleFieldBloc.changeCurrentValue(
      settings.localizationLocale,
    );
  }
}
