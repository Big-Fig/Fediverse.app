import 'dart:async';

import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalPreferencesService extends DisposableOwner
    implements IAsyncInitLoadingBloc {
  bool isKeyExist(String key);

  Future<bool> clear();

  Future<bool> clearValue(String key);

  Future<bool> setString(String key, String value);

  Future<bool> setIntPreference(String key, int value);

  Future<bool> setBoolPreference(String key, bool value);

  Future<bool> setObjectPreference(
      String key, IPreferencesObject preferencesObject);

  bool getBoolPreference(
    String key,
  );

  String getStringPreference(String key);

  int getIntPreference(String key);

  T getObjectPreference<T>(String key);

  static ILocalPreferencesService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ILocalPreferencesService>(context, listen: listen);
}
