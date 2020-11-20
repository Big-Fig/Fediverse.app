import 'package:fedi/app/settings/settings_bloc.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditSettingsBloc<T extends ISettings> extends IFormBloc {
  static IEditSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditSettingsBloc>(context, listen: listen);

  ISettingsBloc<T> get settingsBloc;

  bool get enabled;

  Stream<bool> get enabledStream;

  T get currentSettings;

  Stream<T> get currentSettingsStream;

  Future updateSettings(T settings);

  Future changeEnabled(bool enabled);
}
