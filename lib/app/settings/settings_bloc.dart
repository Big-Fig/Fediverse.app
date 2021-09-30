import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/settings/settings_model.dart';

abstract class ISettingsBloc<T extends ISettings?> implements IDisposable {
  T get settingsData;

  Stream<T> get settingsDataStream;

  Future updateSettings(T newSettings);
}
