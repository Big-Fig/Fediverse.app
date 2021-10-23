import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef ValueCallback<T> = FutureOr<void> Function(T? value);

abstract class ILocalPreferencesService extends DisposableOwner
    implements IAsyncInitLoadingBloc {
  bool isKeyExist(String key);

  Future<void> delete();

  Future<void> clearAllValues();

  Future<void> isStorageExist();

  Future<void> clearAllValuesAndDeleteStorage();

  Future<void> clearValue(String key);

  Future<void> setString(String key, String? value);

  Future<void> setIntPreference(String key, int? value);

  // ignore: avoid_positional_boolean_parameters
  Future<void> setBoolPreference(String key, bool? value);

  Future<void> setObjectPreference(
    String key,
    IJsonObj? preferencesObject,
  );

  bool? getBoolPreference(
    String key,
  );

  String? getStringPreference(String key);

  int? getIntPreference(String key);

  T? getObjectPreference<T>(
    String key,
    T Function(Map<String, dynamic> jsonData) jsonConverter,
  );

  IDisposable listenKeyPreferenceChanged<T>(
    String key,
    ValueCallback onChanged,
  );

  static ILocalPreferencesService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ILocalPreferencesService>(context, listen: listen);
}
