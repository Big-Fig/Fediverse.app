import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'mastodon_api_instance_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('MastodonApiInstanceStats equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          MastodonApiInstanceTestHelper.createTestMastodonApiInstanceStats(
        seed: seed,
      ),
    );
  });

  test('MastodonApiInstanceStats toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          MastodonApiInstanceTestHelper.createTestMastodonApiInstanceStats(
        seed: seed,
      ),
      MastodonApiInstanceStats.fromJson,
    );
  });

  test('MastodonApiUrls equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          MastodonApiInstanceTestHelper.createTestMastodonApiUrls(
        seed: seed,
      ),
    );
  });

  test('MastodonApiUrls toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          MastodonApiInstanceTestHelper.createTestMastodonApiUrls(
        seed: seed,
      ),
      MastodonApiUrls.fromJson,
    );
  });

}
