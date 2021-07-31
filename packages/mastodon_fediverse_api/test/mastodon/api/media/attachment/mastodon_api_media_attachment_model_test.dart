import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = MastodonApiMediaAttachmentType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toMastodonApiMediaAttachmentType();

      expect(value, objFromJsonValue);
    }
  });
}
