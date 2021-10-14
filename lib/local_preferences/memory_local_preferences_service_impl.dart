import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';

var _logger = Logger('memory_local_preferences_service_impl.dart');

class MemoryLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  final Map<String, dynamic> preferences = <String, dynamic>{};

  final Map<String, List<ValueCallback>> listeners = {};

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => 'internalAsyncInit');
  }

  @override
  Future<bool> delete() => clearAllValues();

  @override
  Future<bool> clearAllValues() async {
    preferences.clear();

    listeners.forEach((key, value) {
      for (final listener in value) {
        listener(null);
      }
    });

    return true;
  }

  @override
  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => 'isKeyExist $key => $contains');

    return contains;
  }

  @override
  Future<bool> clearValue(String key) async {
    await preferences.remove(key);
    notifyKeyValueChanged(key, null);

    return true;
  }

  @override
  Future<bool> setString(String key, String? value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);

    return true;
  }

  @override
  Future<bool> setIntPreference(String key, int? value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);

    return true;
  }

  @override
  Future<bool> setBoolPreference(String key, bool? value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);

    return true;
  }

  @override
  Future<bool> setObjectPreference(
    String key,
    IJsonObj? preferencesObject,
  ) async {
    var data = preferencesObject?.toJson();

    String? str;
    if (data != null) {
      str = jsonEncode(data);
    }
    preferences[key] = str;

    notifyKeyValueChanged(key, preferencesObject);

    return true;
  }

  @override
  bool? getBoolPreference(
    String key,
  ) =>
      preferences[key] as bool?;

  @override
  String? getStringPreference(String key) => preferences[key] as String?;

  @override
  int? getIntPreference(String key) => preferences[key] as int?;

  @override
  T? getObjectPreference<T>(
    String key,
    T Function(Map<String, dynamic> jsonData) jsonConverter,
  ) {
    var str = getStringPreference(key);
    if (str?.isNotEmpty == true) {
      return jsonConverter(jsonDecode(str!) as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  @override
  Future<bool> clearAllValuesAndDeleteStorage() => clearAllValues();

  @override
  Future<bool> isStorageExist() async => preferences.isNotEmpty;

  @override
  IDisposable listenKeyPreferenceChanged<T>(
    String key,
    ValueCallback<T> onChanged,
  ) {
    if (!listeners.containsKey(key)) {
      listeners[key] = [];
    }

    // todo: rework
    listeners[key]!.add(onChanged as dynamic Function(dynamic));

    return CustomDisposable(() async {
      listeners[key]!.remove(onChanged);
    });
  }

  void notifyKeyValueChanged(String key, dynamic value) {
    if (listeners.containsKey(key)) {
      for (final listener in listeners[key]!) {
        listener(value);
      }
    }
  }
}
