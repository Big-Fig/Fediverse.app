import 'dart:io';
import 'dart:ui';

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'localization_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'localization_model.g.dart';

@HiveType(typeId: -32 + 82)
@freezed
class LocalizationLocale with _$LocalizationLocale implements IJsonObj {
  const LocalizationLocale._();

  const factory LocalizationLocale({
    @HiveField(0) required String languageCode,
    @HiveField(1) required String? scriptCode,
    @HiveField(2) required String? countryCode,
  }) = _LocalizationLocale;

  String get localeString {
    var result = languageCode;
    if (scriptCode != null) {
      result += '_$scriptCode';
    }
    if (countryCode != null) {
      result += '_$countryCode';
    }

    return result;
  }

  Locale toLocale() => Locale(languageCode, countryCode);

  static LocalizationLocale
      calculateLocaleBaseOnLocalizationLocaleOrPlatformLocale({
    LocalizationLocale? localizationLocale,
  }) {
    LocalizationLocale locale;
    if (localizationLocale != null) {
      locale = LocalizationLocale(
        languageCode: localizationLocale.languageCode,
        countryCode: localizationLocale.countryCode,
        scriptCode: localizationLocale.scriptCode,
      );
    } else {
      var localeName = Platform.localeName;
      if (localeName.contains('_')) {
        var split = localeName.split('_');
        var languageCode = split[0];
        var countryCode = split[1];
        locale = LocalizationLocale(
          languageCode: languageCode,
          countryCode: countryCode,
          scriptCode: null,
        );
      } else {
        locale = LocalizationLocale(
          languageCode: localeName,
          countryCode: null,
          scriptCode: null,
        );
      }
    }

    return locale;
  }

  factory LocalizationLocale.fromJson(Map<String, dynamic> json) =>
      _$LocalizationLocaleFromJson(json);
}
