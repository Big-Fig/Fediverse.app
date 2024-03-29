import 'dart:async';

import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/async/loading/async_loading_service_impl.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('async_init_loading_bloc_impl.dart');

abstract class AsyncInitLoadingBloc extends AsyncLoadingService
    implements IAsyncInitLoadingBloc {
  // ignore: close_sinks
  final BehaviorSubject<AsyncInitLoadingState> _isInitLoadingSubject =
      BehaviorSubject.seeded(AsyncInitLoadingState.notStarted);

  @override
  Stream<AsyncInitLoadingState> get initLoadingStateStream =>
      _isInitLoadingSubject.stream.distinct();

  @override
  AsyncInitLoadingState get initLoadingState => _isInitLoadingSubject.value;

  bool get isInitLoadingStateFinished =>
      initLoadingState == AsyncInitLoadingState.finished;

  @override
  dynamic initLoadingException;

  AsyncInitLoadingBloc() {
    _isInitLoadingSubject.disposeWith(this);
  }

  @override
  Future<void> performAsyncInit() async {
    _logger.finest(() => 'performAsyncInit');
    if (initLoadingState == AsyncInitLoadingState.notStarted) {
      if (!_isInitLoadingSubject.isClosed) {
        _isInitLoadingSubject.add(AsyncInitLoadingState.loading);
      }

      return performLoading(internalAsyncInit).then((dynamic data) {
        if (!_isInitLoadingSubject.isClosed) {
          _isInitLoadingSubject.add(AsyncInitLoadingState.finished);
        }
      }).catchError((dynamic err) {
        _logger.shout(() => 'Error during init $err');
        initLoadingException = err;
        if (!_isInitLoadingSubject.isClosed) {
          _isInitLoadingSubject.add(AsyncInitLoadingState.failed);
        }
        // ignore: throw_of_invalid_type
        throw err;
      });
    }
  }

  void markAsAlreadyInitialized() {
    _isInitLoadingSubject.add(AsyncInitLoadingState.finished);
  }

  @protected
  @mustCallSuper
  Future<void> internalAsyncInit();
}
