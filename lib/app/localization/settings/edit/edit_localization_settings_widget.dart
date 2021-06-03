import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditLocalizationSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditLocalizationSettingsWidget({
    required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        ProxyProvider<IEditLocalizationSettingsBloc,
            ILocalizationLocaleSingleFromListValueFormFieldBloc>(
          update: (context, value, previous) =>
              value.localizationLocaleFieldBloc,
          child:
              const LocalizationLocaleSingleFromListValueFormFieldRowWidget(),
        ),
      ],
    );
  }
}
