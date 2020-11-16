import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditLocalizationSettingsBloc implements IDisposable {
  static IEditLocalizationSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditLocalizationSettingsBloc>(context, listen: listen);

  IFormValueFieldBloc<LocalizationLocale> get localizationLocaleFieldBloc;
}
