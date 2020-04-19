
import 'package:logging/logging.dart';

initTestLog() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}(${record.loggerName}): ${record.time}: '
        '${record.message}');
    if(record.error != null) {
      print("\n${record.error}");
    }
    if(record.stackTrace != null) {
      print("\n${record.stackTrace}");
    }
  });
}
