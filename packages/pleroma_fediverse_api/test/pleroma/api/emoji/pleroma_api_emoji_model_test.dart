import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/emoji/pleroma_api_emoji_test_helper.dart';
import 'package:test/test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiEmoji equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(
        seed: seed,
      ),
    );
  });

  test('PleromaApiEmoji toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(
        seed: seed,
      ),
      PleromaApiEmoji.fromJson,
    );
  });

  test('PleromaApiEmoji hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(
        seed: seed,
      ),
    );
  });

  test('PleromaApiEmoji hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiEmojiAdapter(),
    );
  });

  test('PleromaApiCustomEmoji equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiEmojiTestHelper.createTestPleromaApiCustomEmoji(
        seed: seed,
      ),
    );
  });

  test('PleromaApiCustomEmoji toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiEmojiTestHelper.createTestPleromaApiCustomEmoji(
        seed: seed,
      ),
      PleromaApiCustomEmoji.fromJson,
    );
  });

  test('PleromaApiCustomEmoji hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiEmojiTestHelper.createTestPleromaApiCustomEmoji(
        seed: seed,
      ),
      skipHiveInit: true,
    );
  });

  test('PleromaApiCustomEmoji hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiCustomEmojiAdapter(),
    );
  });
}
