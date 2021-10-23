import 'package:logging/logging.dart';

// ignore_for_file: avoid-ignoring-return-values
class LoggingMockHelper {
  static void initTestLog() {
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
    });
  }
}
