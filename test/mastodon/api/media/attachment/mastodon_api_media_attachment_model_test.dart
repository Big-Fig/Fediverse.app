import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:flutter_test/flutter_test.dart';

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
