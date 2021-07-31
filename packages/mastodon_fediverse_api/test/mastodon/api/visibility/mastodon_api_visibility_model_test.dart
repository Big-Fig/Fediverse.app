import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = MastodonApiVisibility.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toMastodonApiVisibility();

      expect(value, objFromJsonValue);
    }
  });
}
