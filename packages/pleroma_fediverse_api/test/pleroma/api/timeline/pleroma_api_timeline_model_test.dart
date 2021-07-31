import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:test/test.dart';

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
