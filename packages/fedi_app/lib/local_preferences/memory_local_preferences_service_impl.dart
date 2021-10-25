import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';

var _logger = Logger('memory_local_preferences_service_impl.dart');

class MemoryLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  final Map<String, dynamic> preferences = <String, dynamic>{};

  final Map<String, List<ValueCallback>> listeners = {};

  @override
  Future<void> internalAsyncInit() async {
    _logger.fine(() => 'internalAsyncInit');
  }

  @override
  Future<void> delete() => clearAllValues();

  @override
  Future<void> clearAllValues() async {
    preferences.clear();

    listeners.forEach((key, value) {
      for (final listener in value) {
        listener(null);
      }
    });
  }

  @override
  bool isKeyExist(String key) {
    var contains = preferences.containsKey(key);
    _logger.fine(() => 'isKeyExist $key => $contains');

    return contains;
  }

  @override
  Future<void> clearValue(String key) async {
    // ignore: avoid-ignoring-return-values
    await preferences.remove(key);
    notifyKeyValueChanged(key, null);
  }

  @override
  Future<void> setString(String key, String? value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);
  }

  @override
  Future<void> setIntPreference(String key, int? value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);
  }

  @override
  Future<void> setBoolPreference(String key, bool? value) async {
    preferences[key] = value;
    notifyKeyValueChanged(key, value);
  }

  @override
  Future<void> setObjectPreference(
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
  Future<void> clearAllValuesAndDeleteStorage() => clearAllValues();

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
      // ignore: avoid-ignoring-return-values
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
