import 'dart:async';

import 'package:fedi/refactored/async/loading/async_loading_service.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_model.dart';

abstract class IAsyncInitLoadingBloc extends IAsyncLoadingService {
  Stream<AsyncInitLoadingState> get initLoadingStateStream;

  Future performAsyncInit();

  AsyncInitLoadingState get initLoadingState;

  // catched Error or Exception
  dynamic initLoadingException;
}
