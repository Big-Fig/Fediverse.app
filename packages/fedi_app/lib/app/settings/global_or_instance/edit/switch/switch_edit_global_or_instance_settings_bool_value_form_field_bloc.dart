import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc
    implements IBoolValueFormFieldBloc {
  static ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc>(
        context,
        listen: listen,
      );

  GlobalOrInstanceSettingsType? get globalOrInstanceSettingsType;

  Stream<GlobalOrInstanceSettingsType?> get globalOrInstanceSettingsTypeStream;
}
