import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

var _logger = Logger("local_preferences_service_hive_impl.dart");

class HiveLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  Box preferences;

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
    preferences = await Hive.openBox("local_preferences");
  }

  Future<bool> clear() async {
    var clearedKeysCount = await preferences.clear();
    return clearedKeysCount > 0;
  }

  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => "isKeyExist $key => $contains");
    return contains;
  }

  Future<bool> clearValue(String key) async {
    await preferences.delete(key);
    return true;
  }

  Future<bool> setString(String key, String value) async {
    await preferences.put(key, value);
    return true;
  }

  Future<bool> setIntPreference(String key, int value) async {
    await preferences.put(key, value);
    return true;
  }

  Future<bool> setBoolPreference(String key, bool value) async {
    await preferences.put(key, value);
    return true;
  }

  Future<bool> setObjectPreference(
      String key, IPreferencesObject preferencesObject) async {
    await preferences.put(key, preferencesObject);
    return true;
  }

  bool getBoolPreference(
    String key,
  ) =>
      preferences.get(key);

  String getStringPreference(String key) => preferences.get(key);

  int getIntPreference(String key, {@required int defaultValue}) =>
      preferences.get(key);

  T getObjectPreference<T>(String key) {
    return preferences.get(key);
  }
}
