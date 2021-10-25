import 'package:fedi_app/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/app/localization/locale/localization_locale_label_extension.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';

class RegisterUnifediApiAccessLocaleSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  const RegisterUnifediApiAccessLocaleSingleFromListValueFormFieldRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LocalizationLocaleSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<LocalizationLocale?>(
          label: S.of(context).app_auth_instance_register_field_locale_label,
          valueTitleMapper: (context, LocalizationLocale? value) =>
              value?.toLabel(context) ??
              S.of(context).localization_locale_default,
          description:
              S.of(context).app_auth_instance_register_field_locale_description,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );
}
