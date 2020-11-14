import 'package:fedi/disposable/disposable.dart';

abstract class IEditGlobalOrInstanceSettingsBloc extends IDisposable {
  bool get isInstance;

  Stream<bool> get isInstanceStream;

  bool get isGlobal;

  Stream<bool> get isGlobalStream;

  void enableInstanceSettings();

  void enableGlobalSettings();
}
