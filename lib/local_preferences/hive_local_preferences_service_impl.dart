import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

var _logger = Logger("hive_local_preferences_service_impl.dart");

class HiveLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  final String boxName;

  HiveLocalPreferencesService({@required this.boxName});

  Box _preferences;

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
    _preferences = await Hive.openBox(boxName);
  }

  @override
  Future<bool> clear() async {
    var clearedKeysCount = await _preferences.clear();
    return clearedKeysCount > 0;
  }

  @override
  bool isKeyExist(String key) {
    var contains = _preferences.containsKey(key);
    _logger.fine(() => "isKeyExist $key => $contains");
    return contains;
  }

  @override
  Future<bool> clearValue(String key) async {
    await _preferences.delete(key);
    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    await _preferences.put(key, value);
    return true;
  }

  @override
  Future<bool> setIntPreference(String key, int value) async {
    await _preferences.put(key, value);
    return true;
  }

  @override
  Future<bool> setBoolPreference(String key, bool value) async {
    await _preferences.put(key, value);
    return true;
  }

  @override
  Future<bool> setObjectPreference(
      String key, IPreferencesObject preferencesObject) async {
    await _preferences.put(key, preferencesObject);
    return true;
  }

  @override
  bool getBoolPreference(
    String key,
  ) =>
      _preferences.get(key);

  @override
  String getStringPreference(String key) => _preferences.get(key);

  @override
  int getIntPreference(String key, {@required int defaultValue}) =>
      _preferences.get(key);

  @override
  T getObjectPreference<T>(
    String key,
    T jsonConverter(Map<String, dynamic> jsonData),
  ) {
    return _preferences.get(key);
  }
}
