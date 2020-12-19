import 'package:fedi/app/settings/global/edit/edit_global_settings_bloc_impl.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/font_size/form/ui_settings_font_size_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditUiSettingsBloc extends EditGlobalSettingsBloc<UiSettings>
    implements IEditUiSettingsBloc {
  final IUiSettingsBloc uiSettingBloc;

  @override
  final FediUiThemeSingleFromListValueFormFieldBloc fediThemeFieldBloc;
  @override
  final UiSettingsFontSizeSingleFromListValueFormFieldBloc statusFontSizeBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        fediThemeFieldBloc,
        statusFontSizeBloc,
      ];

  final List<IFediUiTheme> availableThemes;

  EditUiSettingsBloc({
    @required this.uiSettingBloc,
    @required bool isEnabled,
    @required this.availableThemes,
  })  : fediThemeFieldBloc = FediUiThemeSingleFromListValueFormFieldBloc(
          originValue: _findThemeById(availableThemes, uiSettingBloc.themeId),
          possibleValues: availableThemes,
        ),
        statusFontSizeBloc = UiSettingsFontSizeSingleFromListValueFormFieldBloc(
          originValue: uiSettingBloc.statusFontSize,
        ),
        super(
          isEnabled: isEnabled,
          settingsBloc: uiSettingBloc,
          isAllItemsInitialized: true,
        ) {
    addDisposable(disposable: fediThemeFieldBloc);
    addDisposable(disposable: statusFontSizeBloc);
  }

  @override
  UiSettings calculateCurrentFormFieldsSettings() => UiSettings(
        themeId: fediThemeFieldBloc.currentValue?.id,
        statusFontSize: statusFontSizeBloc.currentValue?.toJsonValue(),
      );

  @override
  Future fillSettingsToFormFields(UiSettings settings) async {
    fediThemeFieldBloc.changeCurrentValue(
      _findThemeById(
        availableThemes,
        settings.themeId,
      ),
    );

    statusFontSizeBloc.changeCurrentValue(
      settings.statusFontSizeAsUiSettingsFontSize,
    );
  }
}

IFediUiTheme _findThemeById(
    List<IFediUiTheme> availableThemes, String themeId) {
  if (themeId == null) {
    return null;
  }
  return availableThemes.firstWhere(
    (theme) => theme.id == themeId,
  );
}
