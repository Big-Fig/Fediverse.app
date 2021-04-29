import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = PleromaApiNotificationType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiNotificationType();

      expect(value, objFromJsonValue);
    }
  });
}
