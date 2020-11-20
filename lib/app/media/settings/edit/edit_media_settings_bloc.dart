import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditMediaSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<MediaSettings> {
  static IEditMediaSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditMediaSettingsBloc>(context, listen: listen);

  IFormBoolFieldBloc get autoPlayFieldBloc;

  IFormBoolFieldBloc get autoInitFieldBloc;
}
