import 'package:fedi/mastodon/api/search/mastodon_api_search_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = MastodonApiSearchRequestType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toMastodonApiSearchRequestType();

      expect(value, objFromJsonValue);
    }
  });
}
