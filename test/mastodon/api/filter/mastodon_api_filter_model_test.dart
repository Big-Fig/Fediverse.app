import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = MastodonApiFilterContextType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toMastodonApiFilterContextType();

      expect(value, objFromJsonValue);
    }
  });

  test('toMastodonApiFilterContextTypes', () async {
    expect(
      listEquals(
        ['notifications', 'home'].toMastodonApiFilterContextTypes(),
        [
          MastodonApiFilterContextType.notifications,
          MastodonApiFilterContextType.homeAndCustomLists,
        ],
      ),
      true,
    );
  });
}
