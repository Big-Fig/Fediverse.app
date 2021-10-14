import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = ToastHandlingType.values;
    for (final value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toToastHandlingType();

      expect(value, objFromJsonValue);
    }
  });
}
