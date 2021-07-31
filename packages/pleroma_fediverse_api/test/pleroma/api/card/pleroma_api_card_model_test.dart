import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/card/pleroma_api_card_test_helper.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiCard equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiCardTestHelper.createTestPleromaApiCard(
        seed: seed,
      ),
    );
  });

  test('PleromaApiCard toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiCardTestHelper.createTestPleromaApiCard(
        seed: seed,
      ),
      PleromaApiCard.fromJson,
    );
  });

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
      PleromaApiCard.only().isHaveImage,
      false,
    );
  });
  test('typeAsMastodonApi', () async {
    expect(
      PleromaApiCard.only(
        type: null,
      ).typeAsMastodonApi,
      null,
    );
    expect(
      PleromaApiCard.only(
        type: 'video',
      ).typeAsMastodonApi,
      MastodonApiCardType.video,
    );
  });

  test('isHaveContent', () async {
    expect(
      PleromaApiCard.only().isHaveContent,
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
