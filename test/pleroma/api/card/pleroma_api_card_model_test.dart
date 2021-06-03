import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_card_test_helper.dart';

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
}
