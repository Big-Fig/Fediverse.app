import 'package:easy_dispose/easy_dispose.dart';
import 'package:logging/logging.dart';

// ignore_for_file: avoid_print
class LoggingInitHelper {
  static IDisposable initPrintToConsole({
    required bool verbose,
  }) {
    if (verbose) {
      Logger.root.level = Level.ALL;
    } else {
      Logger.root.level = Level.WARNING;
    }
    // ignore: cancel_subscriptions
    var streamSubscription = Logger.root.onRecord.listen((record) {
      print(
        '${record.level.name}(${record.loggerName}): ${record.time}: '
        '${record.message}',
      );
      if (record.error != null) {
        print('\n${record.error}');
      }
      if (record.stackTrace != null) {
        print('\n${record.stackTrace}');
      }
    });

    return StreamSubscriptionDisposable(streamSubscription);
  }
}
