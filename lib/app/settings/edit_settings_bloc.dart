import 'package:fedi/app/settings/settings_bloc.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditSettingsBloc<T extends ISettings<dynamic>?>
    extends IFormBloc {
  static IEditSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditSettingsBloc>(context, listen: listen);

  ISettingsBloc<T> get settingsBloc;

  bool get isEnabled;

  Stream<bool> get isEnabledStream;

  T? get currentSettings;

  Stream<T?> get currentSettingsStream;

  Future updateSettings(T settings);

  Future changeEnabled(bool enabled);
}
