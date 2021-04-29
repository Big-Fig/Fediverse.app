import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = ScheduledStatusState.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toScheduledStatusState();

      expect(value, objFromJsonValue);
    }
  });
}
