import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/app/settings/global/global_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditLocalizationSettingsBloc
    implements IGlobalSettingsBloc<LocalizationSettings> {
  static IEditLocalizationSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditLocalizationSettingsBloc>(context, listen: listen);

  ILocalizationLocaleSingleFromListValueFormFieldBloc
      get localizationLocaleFieldBloc;
}
