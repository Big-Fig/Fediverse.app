import 'package:fedi/enum/enum_values.dart';

enum UiSettingsFontSize {
  smallest,
  small,
  medium,
  large,
  largest,
}

EnumValues<UiSettingsFontSize> uiSettingsFontSizeEnumValues = EnumValues({
  "smallest": UiSettingsFontSize.smallest,
  "small": UiSettingsFontSize.small,
  "medium": UiSettingsFontSize.medium,
  "large": UiSettingsFontSize.large,
  "largest": UiSettingsFontSize.largest,
});

extension UiSettingsFontSizeExtension on UiSettingsFontSize {
  String toJsonValue() {
    var type = uiSettingsFontSizeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }
}

extension UiSettingsFontSizeStringExtension on String {
  UiSettingsFontSize toUiSettingsFontSize() =>
      uiSettingsFontSizeEnumValues.valueToEnumMap[this];
}
