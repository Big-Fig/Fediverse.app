import 'package:fedi/app/logging/logging_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class LoggingService extends AsyncInitLoadingBloc implements ILoggingService {
  @override
  Future internalAsyncInit() async {
    // if (kReleaseMode || kProfileMode) {
    //   Logger.root.level = Level.OFF; // defaults to Level.INFO
    // } else {
      Logger.root.level = Level.ALL; // defaults to Level.INFO
      Logger.root.onRecord.listen((record) {
        print('${record.level.name}(${record.loggerName}): ${record.time}: '
            '${record.message}');
        if (record.error != null) {
          print('\n${record.error}');
        }
        if (record.stackTrace != null) {
          print('\n${record.stackTrace}');
        }
      });
    // }
  }
}
