import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'localization_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 82)
class LocalizationLocale implements IJsonObject {
  @HiveField(0)
  String languageCode;
  @HiveField(1)
  String scriptCode;
  @HiveField(2)
  String countryCode;

  String get localeString {
    var result = "$languageCode";
    if (scriptCode != null) {
      result = "_$scriptCode";
    }
    if (countryCode != null) {
      result = "_$countryCode";
    }
    return result;
  }

  LocalizationLocale({
    this.languageCode,
    this.scriptCode,
    this.countryCode,
  });

  factory LocalizationLocale.fromJson(Map<String, dynamic> json) =>
      _$LocalizationLocaleFromJson(json);

  factory LocalizationLocale.fromJsonString(String jsonString) =>
      _$LocalizationLocaleFromJson(jsonDecode(jsonString));

  static List<LocalizationLocale> listFromJsonString(String str) =>
      List<LocalizationLocale>.from(
          json.decode(str).map((x) => LocalizationLocale.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$LocalizationLocaleToJson(this);

  String toJsonString() => jsonEncode(_$LocalizationLocaleToJson(this));
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
