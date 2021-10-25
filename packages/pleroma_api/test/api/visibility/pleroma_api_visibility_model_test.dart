import 'package:pleroma_api/pleroma_api.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiVisibility toJsonValue & fromJsonValue', () async {
    var values = PleromaApiVisibility.values;
    for (final value in values) {
      var jsonValue = value.stringValue;

      var objFromJsonValue = jsonValue.toPleromaApiVisibility();

      expect(value, objFromJsonValue);
    }
  });
}
