import 'package:fedi/app/localization/localization_locale_label_extension.dart';
import 'package:fedi/app/localization/supported_localization_locales.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger("form_pleroma_localizationLocale_field_form_row_widget.dart");

class FormLocalizationCurrentLocaleFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String desc;
  final IFormValueFieldBloc<LocalizationLocale> field;
  FormLocalizationCurrentLocaleFieldFormRowWidget({
    @required this.label,
    this.desc,
    @required this.field,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    return StreamBuilder<LocalizationLocale>(
      stream: field.currentValueStream.distinct(),
      initialData: field.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;

        _logger.finest(() => "currentValue $currentValue");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _showDialog(context, currentValue);
              },
              child: FediFormRow(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FediFormRowLabel(label),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentValue.toLabel(context),
                          style: fediUiTextTheme.mediumShortDarkGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (desc != null) FediFormColumnDesc(desc),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context, LocalizationLocale currentValue) {
    showFediSelectionChooserDialog(
      context: context,
      title: S.of(context).app_localization_dialog_title,
      actions: [
        buildSystemLocalizationLocaleDialogAction(context, currentValue),
        ...supportedLocalizationLocales.map(
          (localizationLocale) => buildLocalizationLocaleDialogAction(
              context, field, localizationLocale, currentValue),
        )
      ],
    );
  }

  SelectionDialogAction buildSystemLocalizationLocaleDialogAction(
          BuildContext context, LocalizationLocale currentValue) =>
      buildLocalizationLocaleDialogAction(context, field, null, currentValue);

  SelectionDialogAction buildLocalizationLocaleDialogAction(
    BuildContext context,
    IFormValueFieldBloc<LocalizationLocale> field,
    LocalizationLocale localizationLocale,
    LocalizationLocale currentValue,
  ) {
    return SelectionDialogAction(
      icon: null,
      label: localizationLocale.toLabel(context),
      onAction: (context) {
        field.changeCurrentValue(localizationLocale);
        Navigator.of(context).pop();
      },
      isSelected: localizationLocale == currentValue,
    );
  }
}
