import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/async_loading_service.dart';
import 'package:rxdart/rxdart.dart';

typedef LoadingFunction = Future<void> Function();

abstract class AsyncLoadingService extends DisposableOwner
    implements IAsyncLoadingService {
  // ignore: close_sinks
  final BehaviorSubject<bool> _isLoadingSubject =
      BehaviorSubject<bool>.seeded(false);

  @override
  Stream<bool> get isLoadingStream => _isLoadingSubject.stream;

  @override
  bool get isLoading => _isLoadingSubject.value;

  AsyncLoadingService() {
    _isLoadingSubject.disposeWith(this);
  }

  Future<void> performLoading(LoadingFunction loadingFunction) async {
    if (!_isLoadingSubject.isClosed) {
      _isLoadingSubject.add(true);
    }
    await loadingFunction();
    if (!_isLoadingSubject.isClosed) {
      _isLoadingSubject.add(false);
    }
  }
}
