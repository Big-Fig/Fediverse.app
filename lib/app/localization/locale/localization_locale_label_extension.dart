import 'package:fedi/generated/l10n.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final _logger = Logger("localization_locale_label_extension.dart");

extension LocalizaionLocaleLabelExtension on LocalizationLocale {
  String toLabel(BuildContext context) {
    var s = S.of(context);
    if(this == null) {
        return s.localization_locale_system;
    }

    switch (localeString) {
      case "en":
        return s.localization_locale_en;

      case "ru":
        return s.localization_locale_ru;

      default:
        _logger.severe(() => "not supported locale $localeString");
        return localeString;
    }
  }
}
