import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final _logger = Logger('localization_locale_label_extension.dart');

extension LocalizationLocaleLabelExtension on LocalizationLocale {
  String toLabel(BuildContext context) {
    var s = S.of(context);

    switch (localeString) {
      case 'en':
        return s.localization_locale_en;

      case 'ru':
        return s.localization_locale_ru;

      case 'pl':
        return s.localization_locale_pl;

      default:
        _logger.severe(() => 'not supported locale $localeString');
        return localeString;
    }
  }
}
