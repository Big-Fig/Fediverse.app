// ignore_for_file: prefer_const_constructors

import 'package:fedi_app/date/date_utils.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('isToday', () async {
    expect(
      CustomDateUtils.isToday(DateTime.now()),
      true,
    );
    expect(
      CustomDateUtils.isToday(DateTime.now().subtract(Duration(days: 1))),
      false,
    );
    expect(
      CustomDateUtils.isToday(DateTime.now().add(Duration(days: 1))),
      false,
    );
  });

  test('dayStartOf', () async {
    expect(
      CustomDateUtils.dayStartOf(DateTime.now()).hour,
      0,
    );
    expect(
      CustomDateUtils.dayStartOf(DateTime.now()).minute,
      0,
    );
    expect(
      CustomDateUtils.dayStartOf(DateTime.now()).second,
      0,
    );
    expect(
      CustomDateUtils.dayStartOf(DateTime.now()).millisecond,
      0,
    );
    expect(
      CustomDateUtils.dayStartOf(DateTime.now()).microsecond,
      0,
    );
  });

  test('minuteStartOf', () async {
    expect(
      CustomDateUtils.minuteStartOf(DateTime.now()).second,
      0,
    );
    expect(
      CustomDateUtils.minuteStartOf(DateTime.now()).millisecond,
      0,
    );
    expect(
      CustomDateUtils.minuteStartOf(DateTime.now()).microsecond,
      0,
    );
  });

  test('isSameDay', () async {
    expect(
      // ignore: no-equal-arguments
      CustomDateUtils.isSameDay(DateTime.now(), DateTime.now()),
      true,
    );
    expect(
      CustomDateUtils.isSameDay(
        DateTime.now().subtract(Duration(days: 1)),
        DateTime.now(),
      ),
      false,
    );
    expect(
      CustomDateUtils.isSameDay(
        DateTime.now().add(Duration(days: 1)),
        DateTime.now(),
      ),
      false,
    );

    expect(
      CustomDateUtils.isSameDay(
        DateTime(2000, 1, 1, 1),
        DateTime(2000, 1, 1, 2),
      ),
      true,
    );
    expect(
      CustomDateUtils.isSameDay(
        DateTime(2000, 1, 1, 1),
        DateTime(2000, 1, 2, 2),
      ),
      false,
    );
  });

  test('isSameMinute', () async {
    expect(
      // ignore: no-equal-arguments
      CustomDateUtils.isSameMinute(DateTime.now(), DateTime.now()),
      true,
    );
    expect(
      CustomDateUtils.isSameMinute(
        DateTime.now().subtract(Duration(minutes: 1)),
        DateTime.now(),
      ),
      false,
    );
    expect(
      CustomDateUtils.isSameMinute(
        DateTime.now().add(Duration(minutes: 1)),
        DateTime.now(),
      ),
      false,
    );

    expect(
      CustomDateUtils.isSameMinute(
        // ignore: no-equal-arguments
        DateTime(
          2000,
          1,
          1,
          1,
          0,
        ),
        // ignore: no-equal-arguments
        DateTime(
          2000,
          1,
          1,
          1,
          0,
        ),
      ),
      true,
    );
    expect(
      CustomDateUtils.isSameMinute(
        DateTime(2000, 1, 1, 1, 0),
        DateTime(2000, 1, 1, 1, 1),
      ),
      false,
    );
  });
}
