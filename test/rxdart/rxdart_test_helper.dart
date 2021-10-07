import 'dart:async';

typedef DataChecker<T> = T Function();

class RxDartMockHelper {
  static Future<T> waitForData<T>(
    DataChecker<T?> dataChecker, {
    Duration reCheckInterval = const Duration(milliseconds: 10),
    Duration timeout = const Duration(seconds: 1),
  }) async {
    final startData = dataChecker();

    if (startData != null) {
      return startData;
    }

    var start = DateTime.now();

    return _wait(
      reCheckInterval: reCheckInterval,
      start: start,
      dataChecker: dataChecker,
      timeout: timeout,
    );
  }

  static Future<T> _wait<T>({
    required Duration reCheckInterval,
    required DateTime start,
    required DataChecker<T?> dataChecker,
    required Duration timeout,
  }) {
    return Future.delayed(
      reCheckInterval,
      () {
        var currentDiff = DateTime.now().difference(start).abs();

        final currentData = dataChecker();

        if (currentData != null) {
          return currentData;
        }

        if (currentDiff > timeout) {
          throw TimeoutException('Required data not found after $timeout');
        } else {
          return _wait(
            reCheckInterval: reCheckInterval,
            start: start,
            dataChecker: dataChecker,
            timeout: timeout,
          );
        }
      },
    );
  }

  static Future waitToExecuteRxCallbacks({
    Duration duration = const Duration(milliseconds: 1),
  }) =>
      Future.delayed(duration);
}
