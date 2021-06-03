import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'localization_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 82)
class LocalizationLocale implements IJsonObject {
  @HiveField(0)
  final String languageCode;
  @HiveField(1)
  final String? scriptCode;
  @HiveField(2)
  final String? countryCode;

  String get localeString {
    var result = "$languageCode";
    if (scriptCode != null) {
      result += "_$scriptCode";
    }
    if (countryCode != null) {
      result += "_$countryCode";
    }
    return result;
  }

  LocalizationLocale({
    required this.languageCode,
    required this.scriptCode,
    required this.countryCode,
  });

  static LocalizationLocale fromJson(Map<String, dynamic> json) =>
      _$LocalizationLocaleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocalizationLocaleToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationLocale &&
          runtimeType == other.runtimeType &&
          languageCode == other.languageCode &&
          scriptCode == other.scriptCode &&
          countryCode == other.countryCode;

  @override
  int get hashCode =>
      languageCode.hashCode ^ scriptCode.hashCode ^ countryCode.hashCode;

  @override
  String toString() {
    return 'LocalizationLocale{'
        'languageCode: $languageCode,'
        ' scriptCode: $scriptCode,'
        ' countryCode: $countryCode'
        '}';
  }
}
