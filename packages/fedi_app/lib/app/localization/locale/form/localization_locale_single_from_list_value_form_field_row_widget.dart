import 'package:fedi_app/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/app/localization/locale/localization_locale_label_extension.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';

class LocalizationLocaleSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  final String? customLabel;
  final String? customNullLocalizationValue;

  const LocalizationLocaleSingleFromListValueFormFieldRowWidget({
    Key? key,
    this.customLabel,
    this.customNullLocalizationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LocalizationLocaleSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<LocalizationLocale?>(
          label: customLabel ??
              S
                  .of(context)
                  .app_localization_settings_field_localizationLocale_label,
          valueTitleMapper: (context, LocalizationLocale? value) =>
              value?.toLabel(context) ??
              customNullLocalizationValue ??
              S.of(context).localization_locale_default,
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );
}
