import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/mention/pleroma_api_mention_model_impl.dart';
import 'package:pleroma_api/src/api/mention/pleroma_api_mention_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiMention equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiMentionMockHelper.generate,
    );
  });

  test('PleromaApiMention toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiMentionMockHelper.generate,
      (json) => PleromaApiMention.fromJson(json),
    );
  });
  // test('PleromaApiMention toJson & fromJson', () async {
  //   expect(
  //     <IMastodonApiMention>[
  //       PleromaApiMention.only(acct: 'acct1', id: 'id', url: 'url'),
  //       PleromaApiMention.only(acct: 'acct2', id: 'id', url: 'url'),
  //     ].toAccts(),
  //     [
  //       'acct1',
  //       'acct2',
  //     ],
  //   );
  // });
}
