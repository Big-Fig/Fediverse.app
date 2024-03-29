import 'package:fedi_app/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi_app/app/ui/settings/ui_settings_model.dart';

// ignore_for_file: no-magic-number
class UiSettingsModelMockHelper {
  static UiSettings createTestUiSettings({
    required String seed,
  }) =>
      UiSettings.fromEnum(
        themeId: seed + 'themeId',
        statusFontSize: UiSettingsFontSize
            .values[seed.hashCode % UiSettingsFontSize.values.length],
      );
}
