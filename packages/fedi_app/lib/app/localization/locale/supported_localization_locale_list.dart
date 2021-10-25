import 'package:fedi_app/localization/localization_model.dart';

final supportedLocalizationLocaleList = <LocalizationLocale>[
  defaultLocale,
  const LocalizationLocale(
    languageCode: 'ru',
    scriptCode: null,
    countryCode: null,
  ),
  const LocalizationLocale(
    languageCode: 'pl',
    scriptCode: null,
    countryCode: null,
  ),
];

const defaultLocale = LocalizationLocale(
  languageCode: 'en',
  scriptCode: null,
  countryCode: null,
);
