import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiVisibility toJsonValue & fromJsonValue', () async {
    var values = PleromaApiVisibility.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiVisibility();

      expect(value, objFromJsonValue);
    }
  });
}
