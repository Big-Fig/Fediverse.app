import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'localization_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType()
class LocalizationLocale implements IPreferencesObject {
  String locale;

  LocalizationLocale({this.locale});

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
          locale == other.locale;
  @override
  int get hashCode => locale.hashCode;
  @override
  String toString() {
    return 'LocalizationLocale{locale: $locale}';
  }
}
