import 'package:fedi/mastodon/api/visibility/mastodon_api_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';

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
