import 'package:fedi/localization/localization_model.dart';

final supportedLocalizationLocaleList = <LocalizationLocale>[
  defaultLocale,
  LocalizationLocale(
    languageCode: 'ru',
    scriptCode: null,
    countryCode: null,
  ),
];

final defaultLocale = LocalizationLocale(
  languageCode: 'en',
  scriptCode: null,
  countryCode: null,
);
