import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_mention_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiMention equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiMentionTestHelper.createTestPleromaApiMention(
        seed: seed,
      ),
    );
  });

  test('PleromaApiMention toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiMentionTestHelper.createTestPleromaApiMention(
        seed: seed,
      ),
      PleromaApiMention.fromJson,
    );
  });
  test('PleromaApiMention toJson & fromJson', () async {
    expect(
      [
        PleromaApiMention.only(acct: 'acct1', id: 'id', url: 'url'),
        PleromaApiMention.only(acct: 'acct2', id: 'id', url: 'url'),
      ].toAccts(),
      [
        'acct1',
        'acct2',
      ],
    );
  });
}
