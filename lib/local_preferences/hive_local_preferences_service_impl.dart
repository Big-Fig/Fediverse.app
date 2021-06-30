import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

var _logger = Logger('hive_local_preferences_service_impl.dart');

class HiveLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  final String boxName;
  final String? path;

  HiveLocalPreferencesService({
    required this.boxName,
    this.path,
  });

  HiveLocalPreferencesService.withLastVersionBoxName({
    String? path,
  }) : this(
          boxName: 'local_preferences_v2',
          path: path,
        );

  // ignore: avoid-late-keyword
  late Box _box;

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => 'internalAsyncInit');
    _box = await Hive.openBox(
      boxName,
      path: path,
    );
  }

  @override
  Future<bool> clearAllValues() async {
    _logger.fine(() => 'clearAllValues');
    var clearedKeysCount = await _box.clear();

    return clearedKeysCount > 0;
  }

  @override
  Future<bool> delete() async {
    _logger.fine(() => 'delete');
    await _box.deleteFromDisk();

    return true;
  }

  @override
  bool isKeyExist(String key) {
    var contains = _box.containsKey(key);
    _logger.fine(() => 'isKeyExist $key => $contains');

    return contains;
  }

  @override
  Future<bool> clearValue(String key) async {
    await _box.delete(key);

    return true;
  }

  @override
  Future<bool> setString(String key, String? value) async {
    await _box.put(key, value);

    return true;
  }

  @override
  Future<bool> setIntPreference(String key, int? value) async {
    await _box.put(key, value);

    return true;
  }

  @override
  Future<bool> setBoolPreference(String key, bool? value) async {
    await _box.put(key, value);

    return true;
  }

  @override
  Future<bool> setObjectPreference(
    String key,
    IJsonObject? preferencesObject,
  ) async {
    // _logger.fine(() => 'setObjectPreference $key -> $preferencesObject');
    await _box.put(key, preferencesObject);

    return true;
  }

  @override
  bool? getBoolPreference(
    String key,
  ) =>
      _box.get(key);

  @override
  String? getStringPreference(String key) => _box.get(key);

  @override
  int? getIntPreference(String key) => _box.get(key);

  @override
  T? getObjectPreference<T>(
    String key,
    T Function(Map<String, dynamic> jsonData) jsonConverter,
  ) {
    return _box.get(key);
  }

  @override
  Future<bool> clearAllValuesAndDeleteStorage() async {
    await _box.deleteFromDisk();

    return true;
  }

  @override
  Future<bool> isStorageExist() async => _box.length > 0;

  @override
  IDisposable listenKeyPreferenceChanged<T>(
    String key,
    ValueCallback<T> onChanged,
  ) =>
      StreamSubscriptionDisposable(
        _box.watch(key: key).listen(
          (boxEvent) {
            onChanged(boxEvent.value);
          },
        ),
      );
}
