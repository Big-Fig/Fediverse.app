import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/disposable/disposable.dart';

abstract class IGlobalOrInstanceSettingsBloc<T extends ISettings>
    implements IDisposable {
  T get settingsData;

  Stream<T> get settingsDataStream;

  GlobalOrInstanceSettings<T> get globalOrInstanceSettings;

  Stream<GlobalOrInstanceSettings<T>> get globalOrInstanceSettingsStream;

  bool get isInstance;

  Stream<bool> get isInstanceStream;

  bool get isGlobal;

  Stream<bool> get isGlobalStream;

  T get globalSettingsData;

  Stream<T> get globalSettingsDataStream;

  T get instanceSettingsData;

  Stream<T> get instanceSettingsDataStream;

  void clearInstanceSettings();

  void cloneGlobalToInstanceSettings();
}
