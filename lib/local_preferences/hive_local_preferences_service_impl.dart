import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

var _logger = Logger("hive_local_preferences_service_impl.dart");

class HiveLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  Box preferences;

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
    preferences = await Hive.openBox("local_preferences");
  }

  @override
  Future<bool> clear() async {
    var clearedKeysCount = await preferences.clear();
    return clearedKeysCount > 0;
  }

  @override
  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => "isKeyExist $key => $contains");
    return contains;
  }

  @override
  Future<bool> clearValue(String key) async {
    await preferences.delete(key);
    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    await preferences.put(key, value);
    return true;
  }

  @override
  Future<bool> setIntPreference(String key, int value) async {
    await preferences.put(key, value);
    return true;
  }

  @override
  Future<bool> setBoolPreference(String key, bool value) async {
    await preferences.put(key, value);
    return true;
  }

  @override
  Future<bool> setObjectPreference(
      String key, IPreferencesObject preferencesObject) async {
    await preferences.put(key, preferencesObject);
    return true;
  }

  @override
  bool getBoolPreference(
    String key,
  ) =>
      preferences.get(key);

  @override
  String getStringPreference(String key) => preferences.get(key);

  @override
  int getIntPreference(String key, {@required int defaultValue}) =>
      preferences.get(key);

  @override
  T getObjectPreference<T>(String key) {
    return preferences.get(key);
  }
}
