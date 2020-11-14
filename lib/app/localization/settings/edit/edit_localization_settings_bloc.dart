import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditLocalizationSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc {
  static IEditLocalizationSettingsBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<IEditLocalizationSettingsBloc>(context, listen: listen);

  IFormValueFieldBloc<LocalizationLocale> get localizationLocaleFieldBloc;
}
