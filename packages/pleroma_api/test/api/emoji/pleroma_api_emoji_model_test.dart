import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/emoji/custom/pleroma_api_custom_emoji_model_impl.dart';
import 'package:pleroma_api/src/api/emoji/custom/pleroma_api_custom_emoji_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/emoji/pleroma_api_emoji_model_impl.dart';
import 'package:pleroma_api/src/api/emoji/pleroma_api_emoji_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('PleromaApiEmoji equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiEmojiMockHelper.generate,
    );
  });

  test('PleromaApiEmoji toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiEmojiMockHelper.generate,
      (json) => PleromaApiEmoji.fromJson(json),
    );
  });

  test('PleromaApiEmoji hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiEmojiMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiEmoji hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiEmojiAdapter(),
    );
  });

  test('PleromaApiCustomEmoji equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiCustomEmojiMockHelper.generate,
    );
  });

  test('PleromaApiCustomEmoji toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiCustomEmojiMockHelper.generate,
      (json) => PleromaApiCustomEmoji.fromJson(json),
    );
  });

  test('PleromaApiCustomEmoji hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiCustomEmojiMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiCustomEmoji hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiCustomEmojiAdapter(),
    );
  });
}
