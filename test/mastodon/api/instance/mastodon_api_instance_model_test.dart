import 'package:fedi/mastodon/api/instance/mastodon_api_instance_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
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

  test('MastodonApiInstanceStats hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          MastodonApiInstanceTestHelper.createTestMastodonApiInstanceStats(
        seed: seed,
      ),
    );
  });

  test('MastodonApiInstanceStats hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => MastodonApiInstanceStatsAdapter(),
    );
  });

  test('MastodonApiUrls hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          MastodonApiInstanceTestHelper.createTestMastodonApiUrls(
        seed: seed,
      ),
      skipHiveInit: true,
    );
  });

  test('MastodonApiUrls hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => MastodonApiUrlsAdapter(),
    );
  });
}
