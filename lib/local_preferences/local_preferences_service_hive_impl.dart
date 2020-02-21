
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("local_preferences_service_hive_impl.dart");

class PreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  SharedPreferences preferences;

  @override
  Future internalAsyncInit() async {
    preferences = await SharedPreferences.getInstance();
    _logger.d(() => "loaded preferences = $preferences");
  }

  Future<bool> clear() => preferences.clear();

  bool isKeyExist(String key) {
    Set<String> keys = preferences.getKeys();
    _logger.d(() => "isKeyExist $keys");
    var contains = keys.contains(key);
    _logger.d(() => "isKeyExist $key => $contains");
    return contains;
  }

  Future<bool> clearValue(String key) async => preferences.remove(key);

  Future<bool> setString(String key, String value) async =>
      await preferences.setString(key, value);

  Future<bool> setIntPreference(String key, int value) async =>
      await preferences.setInt(key, value);

  Future<bool> setBoolPreference(String key, bool value) async =>
      await preferences.setBool(key, value);

  Future<bool> setObjectPreference(
      String key, IPreferencesObject preferencesObject) async =>
      await setJsonObjectAsString(key, preferencesObject?.toJson());

  Future<bool> setJsonObjectAsString(
      String key, Map<String, dynamic> jsonObject) async =>
      await setString(key, json.encode(jsonObject));

  bool getBoolPreference(
      String key,
      ) =>
      preferences.getBool(key);

  String getStringPreference(String key) => preferences.getString(key);

  int getIntPreference(String key, {@required int defaultValue}) =>
      preferences.getInt(key);

  T getObjectPreference<T>(
      String key, T jsonConverter(Map<String, dynamic> jsonData),
      {@required IPreferencesObject defaultValue}) {
    var stringPreference = getStringPreference(key);
    if (stringPreference == null) {
      return null;
    }
    var jsonObject = json.decode(stringPreference);
    return jsonObject != null ? jsonConverter(jsonObject) : null;
  }
}
