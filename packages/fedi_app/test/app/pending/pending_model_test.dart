import 'package:fedi_app/app/pending/pending_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = PendingState.values;
    for (final value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPendingState();

      expect(value, objFromJsonValue);
    }
  });
}
