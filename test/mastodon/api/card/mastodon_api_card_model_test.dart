import 'package:fedi/mastodon/api/card/mastodon_api_card_model.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = MastodonApiCardType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toMastodonApiCardType();

      expect(value, objFromJsonValue);
    }
  });
  test('isHaveImage', () async {
    expect(
      PleromaApiCard.only(
        image: 'image',
      ).isHaveImage,
      true,
    );

    expect(
      PleromaApiCard.only(
      ).isHaveImage,
      false,
    );
  });
  test('typeAsMastodonApi', () async {
    expect(
      PleromaApiCard.only(
        type: null,
      ).typeAsMastodonApi,
      null,
    );    expect(
      PleromaApiCard.only(
        type: 'video',
      ).typeAsMastodonApi,
      MastodonApiCardType.video,
    );

  });

  test('isHaveContent', () async {
    expect(
      PleromaApiCard.only(
      ).isHaveContent,
      false,
    );
    expect(
      PleromaApiCard.only(
        title: 'title',
      ).isHaveContent,
      true,
    );

    expect(
      PleromaApiCard.only(
        html: 'html',
      ).isHaveContent,
      true,
    );
    expect(
      PleromaApiCard.only(description: 'description').isHaveContent,
      true,
    );
  });
}
