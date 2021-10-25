import 'package:fedi_app/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = UiSettingsFontSize.values;
    for (final value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toUiSettingsFontSize();

      expect(value, objFromJsonValue);
    }
  });
}
