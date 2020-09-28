import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';

abstract class ILocalPreferenceBloc<T> extends DisposableOwner
    implements IAsyncInitLoadingBloc {
  T get value;

  Stream<T> get stream;

  bool get isSavedPreferenceExist;

  Future<bool> clearValue();

  Future<bool> setValue(T newValue);

  Future reload();
}
