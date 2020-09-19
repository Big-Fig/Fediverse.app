import 'dart:convert';

import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _logger = Logger("shared_preferences_local_preferences_service_impl.dart");

var _specialStorageKeyCreatedKey = "_specialStorageKeyCreatedKey";

class SharedPreferencesLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  SharedPreferences preferences;

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
    preferences = await SharedPreferences.getInstance();
  }

  Future putStorageCreatedKey() async {
    await preferences.setString(
        _specialStorageKeyCreatedKey, _specialStorageKeyCreatedKey);
  }

  @override
  Future<bool> clearAllValues() => preferences.clear();

  @override
  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => "isKeyExist $key => $contains");
    return contains;
  }

  @override
  Future<bool> clearValue(String key) => preferences.remove(key);

  @override
  Future<bool> setString(String key, String value) =>
      preferences.setString(key, value);

  @override
  Future<bool> setIntPreference(String key, int value) =>
      preferences.setInt(key, value);

  @override
  Future<bool> setBoolPreference(String key, bool value) =>
      preferences.setBool(key, value);

  @override
  Future<bool> setObjectPreference(
          String key, IPreferencesObject preferencesObject) =>
      setJsonObjectAsString(key, preferencesObject?.toJson());

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
  T getObjectPreference<T>(
    String key,
    T jsonConverter(Map<String, dynamic> jsonData),
  ) {
    var stringPreference = getStringPreference(key);
    if (stringPreference?.isNotEmpty != true) {
      return null;
    }
    var jsonObject = json.decode(stringPreference);
    return jsonObject != null ? jsonConverter(jsonObject) : null;
  }

  Future<bool> setJsonObjectAsString(
    String key,
    Map<String, dynamic> jsonObject,
  ) =>
      setString(key, jsonObject != null ? json.encode(jsonObject) : null);

  @override
  Future<bool> clearAllValuesAndDeleteStorage() => clearAllValues();

  @override
  Future<bool> isStorageExist() async =>
      preferences.containsKey(_specialStorageKeyCreatedKey);
}
