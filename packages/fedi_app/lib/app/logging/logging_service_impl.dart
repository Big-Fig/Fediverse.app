import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/logging/logging_service.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:logging/logging.dart';

class LoggingService extends AsyncInitLoadingBloc implements ILoggingService {
  final bool enabled;

  LoggingService({
    required this.enabled,
  });

  @override
  Future<void> internalAsyncInit() async {
    if (enabled) {
      // if (true) {
      Logger.root.level = Level.ALL; // defaults to Level.INFO
      Logger.root.onRecord.listen((record) {
        // ignore: avoid_print
        print(
          '${record.level.name}(${record.loggerName}): ${record.time}: '
          '${record.message}',
        );
        if (record.error != null) {
          // ignore: avoid_print
          print('\n${record.error}');
        }
        if (record.stackTrace != null) {
          // ignore: avoid_print
          print('\n${record.stackTrace}');
        }
      }).disposeWith(this);
    } else {
      Logger.root.level = Level.OFF; // defaults to Level.INFO
    }
  }
}
