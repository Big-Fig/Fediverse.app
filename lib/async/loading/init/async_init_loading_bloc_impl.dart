import 'dart:async';

import 'package:fedi/async/loading/async_loading_service_impl.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("async_init_loading_bloc_impl.dart");

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

  @override
  dynamic initLoadingException;

  AsyncInitLoadingBloc() {
    addDisposable(subject: _isInitLoadingSubject);
  }

  @override
  Future performAsyncInit() async {
    if (initLoadingState == AsyncInitLoadingState.notStarted) {
      if (!_isInitLoadingSubject.isClosed) {
        _isInitLoadingSubject.add(AsyncInitLoadingState.loading);
      }

      return performLoading(internalAsyncInit).then((_) {
        if (!_isInitLoadingSubject.isClosed) {
          _isInitLoadingSubject.add(AsyncInitLoadingState.finished);
        }
      }).catchError((err) {
        _logger.shout(() => "Error during init $err");
        initLoadingException = err;
        if (!_isInitLoadingSubject.isClosed) {
          _isInitLoadingSubject.add(AsyncInitLoadingState.failed);
        }
        throw err;
      });
    }
  }

  void markAsAlreadyInitialized() {
    _isInitLoadingSubject.add(AsyncInitLoadingState.finished);
  }

  @protected
  Future internalAsyncInit();
}
