import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = PleromaApiReplyVisibilityFilter.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiReplyVisibilityFilter();

      expect(value, objFromJsonValue);
    }
  });
}
