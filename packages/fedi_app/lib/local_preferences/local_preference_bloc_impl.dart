import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class LocalPreferenceBloc<T> extends AsyncInitLoadingBloc
    implements IAsyncInitLoadingBloc, ILocalPreferenceBloc<T> {
  final ILocalPreferencesService preferencesService;
  final String key;

  // ignore: close_sinks
  final BehaviorSubject<T> _subject = BehaviorSubject();

  @override
  T get value => _subject.valueOrNull ?? defaultPreferenceValue;

  @override
  Stream<T> get stream => _subject.stream;

  LocalPreferenceBloc({
    required this.preferencesService,
    required this.key,
  }) {
    _subject.disposeWith(this);
  }

  T get defaultPreferenceValue;

  IDisposable? keyPreferenceChangedDisposable;

  @override
  Future<void> internalAsyncInit() async {
    _subject.add((await getValueInternal()) ?? defaultPreferenceValue);

    // ignore: cascade_invocations
    _subject.disposeWith(this);
    keyPreferenceChangedDisposable =
        preferencesService.listenKeyPreferenceChanged<dynamic>(
      key,
      (dynamic newValue) {
        if (!_subject.isClosed) {
          // after clearValue newValue will be null
          // but T may be non-nullable
          if (newValue is T) {
            _subject.add(newValue);
          } else {
            _subject.add(defaultPreferenceValue);
          }
        }
      },
    );
    keyPreferenceChangedDisposable!.disposeWith(this);
  }

  @override
  bool get isSavedPreferenceExist => preferencesService.isKeyExist(key);

  @override
  Future<void> clearValue() async => preferencesService.clearValue(key);

  @override
  Future<void> clearValueAndDispose() async {
    // avoid errors for non-nullable types after clearValue
    await keyPreferenceChangedDisposable?.dispose();
    await clearValue();
    await dispose();
  }

  @override
  Future<void> setValue(T newValue) {
    var future = setValueInternal(newValue);
    if (!_subject.isClosed) {
      _subject.add(newValue);
    }

    return future;
  }

  @override
  Future<void> reload() async {
    _subject.add(await getValueInternal());
  }

  @protected
  Future<T> getValueInternal();

  @protected
  Future<void> setValueInternal(T newValue);
}

abstract class ObjectLocalPreferenceBloc<T extends IJsonObj?>
    extends LocalPreferenceBloc<T> {
  final T Function(Map<String, dynamic> jsonData) jsonConverter;
  final int schemaVersion;

  ObjectLocalPreferenceBloc({
    required ILocalPreferencesService preferencesService,
    required String key,
    required this.schemaVersion,
    required this.jsonConverter,
  }) : super(
          preferencesService: preferencesService,
          key: '$key.$schemaVersion',
        );

  @override
  Future<void> setValueInternal(T? newValue) async =>
      preferencesService.setObjectPreference(key, newValue);

  @override
  Future<T> getValueInternal() async =>
      preferencesService.getObjectPreference(key, jsonConverter) ??
      defaultPreferenceValue;
}

abstract class SimpleLocalPreferencesBloc<T> extends LocalPreferenceBloc<T> {
  SimpleLocalPreferencesBloc({
    required ILocalPreferencesService preferencesService,
    required String key,
  }) : super(
          preferencesService: preferencesService,
          key: key,
        );
}

abstract class IntPreferenceBloc extends SimpleLocalPreferencesBloc<int> {
  IntPreferenceBloc({
    required ILocalPreferencesService preferencesService,
    required String key,
  }) : super(
          preferencesService: preferencesService,
          key: key,
        );

  @override
  Future<void> setValueInternal(int newValue) async =>
      preferencesService.setIntPreference(key, newValue);

  @override
  Future<int> getValueInternal() async =>
      preferencesService.getIntPreference(
        key,
      ) ??
      defaultPreferenceValue;
}

abstract class BoolLocalPreferenceBloc
    extends SimpleLocalPreferencesBloc<bool> {
  BoolLocalPreferenceBloc({
    required ILocalPreferencesService preferencesService,
    required String key,
  }) : super(
          preferencesService: preferencesService,
          key: key,
        );

  @override
  Future<void> setValueInternal(bool newValue) async =>
      preferencesService.setBoolPreference(key, newValue);

  @override
  Future<bool> getValueInternal() async =>
      preferencesService.getBoolPreference(
        key,
      ) ??
      defaultPreferenceValue;
}

abstract class StringLocalPreferenceBloc
    extends SimpleLocalPreferencesBloc<String> {
  StringLocalPreferenceBloc({
    required ILocalPreferencesService preferencesService,
    required String key,
  }) : super(
          preferencesService: preferencesService,
          key: key,
        );

  @override
  Future<void> setValueInternal(String newValue) async =>
      preferencesService.setString(key, newValue);

  @override
  Future<String> getValueInternal() async =>
      preferencesService.getStringPreference(
        key,
      ) ??
      defaultPreferenceValue;
}

abstract class StringNullableLocalPreferenceBloc
    extends SimpleLocalPreferencesBloc<String?> {
  StringNullableLocalPreferenceBloc({
    required ILocalPreferencesService preferencesService,
    required String key,
  }) : super(
          preferencesService: preferencesService,
          key: key,
        );

  @override
  Future<void> setValueInternal(String? newValue) async =>
      preferencesService.setString(key, newValue);

  @override
  Future<String?> getValueInternal() async =>
      preferencesService.getStringPreference(
        key,
      );

  @override
  String? get defaultPreferenceValue => null;
}
