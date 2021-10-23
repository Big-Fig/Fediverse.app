import 'package:json_annotation/json_annotation.dart';

enum UiSettingsFontSize {
  smallest,
  small,
  medium,
  large,
  largest,
}

const _smallestUiSettingsFontSizeJsonValue = 'smallest';
const _smallUiSettingsFontSizeJsonValue = 'small';
const _mediumUiSettingsFontSizeJsonValue = 'medium';
const _largeUiSettingsFontSizeJsonValue = 'large';
const _largestUiSettingsFontSizeJsonValue = 'largest';

extension UiSettingsFontSizeListExtension on List<UiSettingsFontSize> {
  List<String> toUiSettingsFontSizeStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension UiSettingsFontSizeExtension on UiSettingsFontSize {
  String toJsonValue() {
    String result;

    switch (this) {
      case UiSettingsFontSize.smallest:
        result = _smallestUiSettingsFontSizeJsonValue;
        break;
      case UiSettingsFontSize.small:
        result = _smallUiSettingsFontSizeJsonValue;
        break;
      case UiSettingsFontSize.medium:
        result = _mediumUiSettingsFontSizeJsonValue;
        break;
      case UiSettingsFontSize.large:
        result = _largeUiSettingsFontSizeJsonValue;
        break;
      case UiSettingsFontSize.largest:
        result = _largestUiSettingsFontSizeJsonValue;
        break;
    }

    return result;
  }
}

extension UiSettingsFontSizeStringExtension on String {
  UiSettingsFontSize toUiSettingsFontSize() {
    UiSettingsFontSize result;

    switch (this) {
      case _smallestUiSettingsFontSizeJsonValue:
        result = UiSettingsFontSize.smallest;
        break;
      case _smallUiSettingsFontSizeJsonValue:
        result = UiSettingsFontSize.small;
        break;
      case _mediumUiSettingsFontSizeJsonValue:
        result = UiSettingsFontSize.medium;
        break;
      case _largeUiSettingsFontSizeJsonValue:
        result = UiSettingsFontSize.large;
        break;
      case _largestUiSettingsFontSizeJsonValue:
        result = UiSettingsFontSize.largest;
        break;
      default:
        throw ArgumentError('Invalid UiSettingsFontSize $this');
    }

    return result;
  }
}

extension UiSettingsFontSizeStringListExtension on List<String> {
  List<UiSettingsFontSize> toPleromaVisibilities() => map(
        (visibilityString) => visibilityString.toUiSettingsFontSize(),
      ).toList();
}

class UiSettingsFontSizeTypeConverter
    implements JsonConverter<UiSettingsFontSize, String> {
  const UiSettingsFontSizeTypeConverter();

  @override
  UiSettingsFontSize fromJson(String value) => value.toUiSettingsFontSize();

  @override
  String toJson(UiSettingsFontSize value) => value.toJsonValue();
}
