import 'dart:async';

import 'package:fedi_app/async/loading/async_loading_service.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_model.dart';

abstract class IAsyncInitLoadingBloc extends IAsyncLoadingService {
  Stream<AsyncInitLoadingState> get initLoadingStateStream;

  Future<void> performAsyncInit();

  AsyncInitLoadingState? get initLoadingState;

  // catched Error or Exception
  dynamic get initLoadingException;
}
