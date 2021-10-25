import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/localization/locale/supported_localization_locale_list.dart';
import 'package:fedi_app/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_model.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class EditLocalizationSettingsBloc
    extends EditGlobalSettingsBloc<LocalizationSettings?>
    implements IEditLocalizationSettingsBloc {
  final ILocalizationSettingsBloc localizationSettingsBloc;

  @override
  final ILocalizationLocaleSingleFromListValueFormFieldBloc
      localizationLocaleFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        localizationLocaleFieldBloc,
      ];

  EditLocalizationSettingsBloc({
    required this.localizationSettingsBloc,
    required bool isEnabled,
  })  : localizationLocaleFieldBloc =
            LocalizationLocaleSingleFromListValueFormFieldBloc(
          originValue: localizationSettingsBloc.localizationLocale,
          isEnabled: isEnabled,
          possibleValues: supportedLocalizationLocaleList,
        ),
        super(
          isEnabled: isEnabled,
          settingsBloc: localizationSettingsBloc,
          isAllItemsInitialized: true,
        ) {
    addDisposable(localizationLocaleFieldBloc);
  }

  @override
  LocalizationSettings? get settingsData =>
      localizationSettingsBloc.settingsData;

  @override
  Stream<LocalizationSettings?> get settingsDataStream =>
      localizationSettingsBloc.settingsDataStream;

  @override
  LocalizationSettings calculateCurrentFormFieldsSettings() =>
      LocalizationSettings(
        localizationLocale: localizationLocaleFieldBloc.currentValue,
      );

  @override
  Future<void> fillSettingsToFormFields(LocalizationSettings? settings) async {
    localizationLocaleFieldBloc.changeCurrentValue(
      settings?.localizationLocale,
    );
  }
}
