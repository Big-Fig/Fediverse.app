import 'package:fedi/disposable/disposable_owner.dart';

abstract class ILocalPreferenceBloc<T> extends DisposableOwner {
  T get value;

  Stream<T> get stream;

  bool get isSavedPreferenceExist;

  Future<bool> clearValue();

  Future<bool> setValue(T newValue);
}
