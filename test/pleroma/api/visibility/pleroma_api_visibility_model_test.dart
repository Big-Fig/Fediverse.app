import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';

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
