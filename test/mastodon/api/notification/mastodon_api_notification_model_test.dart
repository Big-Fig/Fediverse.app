import 'package:fedi/mastodon/api/notification/mastodon_api_notification_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = MastodonApiNotificationType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toMastodonApiNotificationType();

      expect(value, objFromJsonValue);
    }
  });
}
