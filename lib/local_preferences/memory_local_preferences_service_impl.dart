import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("memory_local_preferences_service_impl.dart");

class MemoryLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  final Map<String, dynamic> preferences = {};

  final Map<String, List<ValueCallback>> listeners = {};

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
  }

  @override
  Future<bool> clearAllValues() async {
    preferences.clear();

    listeners.forEach((key, value) {
      value.forEach((listener) {
        listener(null);
      });
    });

    return true;
  }

  @override
  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => "isKeyExist $key => $contains");
    return contains;
  }

  @override
  Future<bool> clearValue(String key) async {
    await preferences.remove(key);
    notifyKeyValueChanged(key, null);
    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);
    return true;
  }

  @override
  Future<bool> setIntPreference(String key, int value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);
    return true;
  }

  @override
  Future<bool> setBoolPreference(String key, bool value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);
    return true;
  }

  @override
  Future<bool> setObjectPreference(
      String key, IPreferencesObject preferencesObject) async {
    preferences[key] = preferencesObject;
    notifyKeyValueChanged(key, preferencesObject);
    return true;
  }

  @override
  bool getBoolPreference(
    String key,
  ) =>
      preferences[key];

  @override
  String getStringPreference(String key) => preferences[key];

  @override
  int getIntPreference(String key, {@required int defaultValue}) =>
      preferences[key];

  @override
  T getObjectPreference<T>(
    String key,
    T jsonConverter(Map<String, dynamic> jsonData),
  ) {
    return preferences[key];
  }

  @override
  Future<bool> clearAllValuesAndDeleteStorage() => clearAllValues();

  @override
  Future<bool> isStorageExist() async => preferences.isNotEmpty;

  @override
  Disposable listenKeyPreferenceChanged<T>(
      String key, ValueCallback<T> onChanged) {
    if (!listeners.containsKey(key)) {
      listeners[key] = [];
    }

    listeners[key].add(onChanged);

    return CustomDisposable(() {
      listeners[key].remove(onChanged);
    });
  }

  void notifyKeyValueChanged(String key, dynamic value) {
    if (listeners.containsKey(key)) {
      listeners[key].forEach((listener) {
        listener(value);
      });
    }
  }
}
