import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("local_preferences_service_memory_impl.dart");

class MemoryLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  final Map<String, dynamic> preferences = Map();

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
  }

  Future<bool> clear() async {
    preferences.clear();
    return true;
  }

  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => "isKeyExist $key => $contains");
    return contains;
  }

  Future<bool> clearValue(String key) async {
    await preferences.remove(key);
    return true;
  }

  Future<bool> setString(String key, String value) async {
    preferences[key] = value;
    return true;
  }

  Future<bool> setIntPreference(String key, int value) async {
    preferences[key] = value;
    return true;
  }

  Future<bool> setBoolPreference(String key, bool value) async {
    preferences[key] = value;
    return true;
  }

  Future<bool> setObjectPreference(
      String key, IPreferencesObject preferencesObject) async {
    preferences[key] = preferencesObject;
    return true;
  }

  bool getBoolPreference(
    String key,
  ) =>
      preferences[key];

  String getStringPreference(String key) => preferences[key];

  int getIntPreference(String key, {@required int defaultValue}) =>
      preferences[key];

  T getObjectPreference<T>(String key) {
    return preferences[key];
  }
}
