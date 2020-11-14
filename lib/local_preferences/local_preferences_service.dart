import 'dart:async';

import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef ValueCallback<T> = Function(T value);

abstract class ILocalPreferencesService extends DisposableOwner
    implements IAsyncInitLoadingBloc {
  bool isKeyExist(String key);

  Future<bool> clearAllValues();

  Future<bool> isStorageExist();

  Future<bool> clearAllValuesAndDeleteStorage();

  Future<bool> clearValue(String key);

  Future<bool> setString(String key, String value);

  Future<bool> setIntPreference(String key, int value);

  Future<bool> setBoolPreference(String key, bool value);

  Future<bool> setObjectPreference(
    String key,
    IJsonObject preferencesObject,
  );

  bool getBoolPreference(
    String key,
  );

  String getStringPreference(String key);

  int getIntPreference(String key);

  T getObjectPreference<T>(
    String key,
    T jsonConverter(Map<String, dynamic> jsonData),
  );

  IDisposable listenKeyPreferenceChanged<T>(String key, ValueCallback onChanged);

  static ILocalPreferencesService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ILocalPreferencesService>(context, listen: listen);
}
