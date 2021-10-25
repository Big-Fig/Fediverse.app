import 'package:mastodon_api/mastodon_api.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = MastodonApiNotificationType.values;
    for (final value in values) {
      var jsonValue = value.stringValue;

      var objFromJsonValue = jsonValue.toMastodonApiNotificationType();

      expect(value, objFromJsonValue);
    }
  });
}
