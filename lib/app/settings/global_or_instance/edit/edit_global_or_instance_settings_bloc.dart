import 'package:fedi/app/settings/edit_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditGlobalOrInstanceSettingsBloc<T extends ISettings>
    extends IEditSettingsBloc<T> {
  static IEditGlobalOrInstanceSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditGlobalOrInstanceSettingsBloc>(context, listen: listen);

  IGlobalOrInstanceSettingsBloc<T> get globalOrInstanceSettingsBloc;

  bool get isInstance;

  bool get isGlobal;

  bool get isGlobalForced;

  GlobalOrInstanceSettingsType get globalOrInstanceSettingsType;
}
