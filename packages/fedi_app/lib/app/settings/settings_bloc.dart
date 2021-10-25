import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/settings/settings_model.dart';

abstract class ISettingsBloc<T extends ISettings<dynamic>?>
    implements IDisposable {
  T get settingsData;

  Stream<T> get settingsDataStream;

  Future<void> updateSettings(T newSettings);
}
