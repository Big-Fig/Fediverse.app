import 'package:pleroma_api/src/api/visibility/reply_filter/pleroma_api_timeline_reply_visibility_filter_model.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = PleromaApiReplyVisibilityFilter.values;
    for (final value in values) {
      var jsonValue = value.stringValue;

      var objFromJsonValue = jsonValue.toPleromaApiReplyVisibilityFilter();

      expect(value, objFromJsonValue);
    }
  });
}
