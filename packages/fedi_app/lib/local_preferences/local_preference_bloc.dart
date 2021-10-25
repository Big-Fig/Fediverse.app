import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';

abstract class ILocalPreferenceBloc<T> extends DisposableOwner
    implements IAsyncInitLoadingBloc {
  T get value;

  Stream<T> get stream;

  bool get isSavedPreferenceExist;

  Future<void> clearValue();

  Future<void> setValue(T newValue);

  Future<void> reload();

  Future<void> clearValueAndDispose();
}
