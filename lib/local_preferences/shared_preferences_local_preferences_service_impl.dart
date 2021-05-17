import 'dart:convert';

import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _logger = Logger("shared_preferences_local_preferences_service_impl.dart");

const _specialStorageKeyCreatedKey = "_specialStorageKeyCreatedKey";
const _specialStorageKeyCreatedValue = _specialStorageKeyCreatedKey;

class SharedPreferencesLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  late SharedPreferences preferences;

  final Map<String, List<ValueCallback>> listeners = {};

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
    preferences = await SharedPreferences.getInstance();
  }

  Future putStorageCreatedKey() async {
    await preferences.setString(
      _specialStorageKeyCreatedKey,
      _specialStorageKeyCreatedValue,
    );
  }

  @override
  Future<bool> clearAllValues() async {
    var result = await preferences.clear();

    listeners.forEach((key, value) {
      value.forEach((listener) {
        listener(null);
      });
    });

    return result;
  }

  @override
  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => "isKeyExist $key => $contains");

    return contains;
  }

  @override
  Future<bool> clearValue(String key) async {
    var result = await preferences.remove(key);
    notifyKeyValueChanged(key, null);

    return result;
  }

  @override
  Future<bool> setString(String key, String? value) async {
    var result = await preferences.setString(key, value!);
    notifyKeyValueChanged(key, value);

    return result;
  }

  @override
  Future<bool> setIntPreference(String key, int? value) async {
    var result = await preferences.setInt(key, value!);
    notifyKeyValueChanged(key, value);

    return result;
  }

  @override
  Future<bool> setBoolPreference(String key, bool? value) async {
    var result = await preferences.setBool(key, value!);
    notifyKeyValueChanged(key, value);

    return result;
  }

  @override
  Future<bool> setObjectPreference(
    String key,
    IJsonObject? preferencesObject,
  ) async {
    var result = await setJsonObjectAsString(key, preferencesObject?.toJson());
    notifyKeyValueChanged(key, preferencesObject);

    return result;
  }

  @override
  bool? getBoolPreference(
    String key,
  ) =>
      preferences.getBool(key);

  @override
  String? getStringPreference(String key) => preferences.getString(key);

  @override
  int? getIntPreference(String key) => preferences.getInt(key);

  @override
  T? getObjectPreference<T>(
    String key,
    T Function(Map<String, dynamic> jsonData) jsonConverter,
  ) {
    var stringPreference = getStringPreference(key);
    if (stringPreference?.isNotEmpty != true) {
      return null;
    }
    var jsonObject = json.decode(stringPreference!);

    return jsonObject != null ? jsonConverter(jsonObject) : null;
  }

  Future<bool> setJsonObjectAsString(
    String key,
    Map<String, dynamic>? jsonObject,
  ) async {
    if (jsonObject != null) {
      return await preferences.setString(
        key,
        json.encode(jsonObject),
      );
    } else {
      return preferences.remove(key);
    }
  }

  @override
  Future<bool> clearAllValuesAndDeleteStorage() => clearAllValues();

  @override
  Future<bool> isStorageExist() async =>
      preferences.containsKey(_specialStorageKeyCreatedKey);

  @override
  IDisposable listenKeyPreferenceChanged<T>(
    String key,
    ValueCallback<T> onChanged,
  ) {
    if (!listeners.containsKey(key)) {
      listeners[key] = [];
    }

    listeners[key]!.add(onChanged as dynamic Function(dynamic));

    return CustomDisposable(() async {
      listeners[key]!.remove(onChanged);
    });
  }

  void notifyKeyValueChanged(String key, dynamic value) {
    if (listeners.containsKey(key)) {
      listeners[key]!.forEach((listener) {
        listener(value);
      });
    }
  }

  @override
  Future<bool> delete() => clearAllValues();
}
