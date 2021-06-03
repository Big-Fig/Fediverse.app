import 'package:fedi/pleroma/api/search/pleroma_api_search_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_search_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiSearch equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiSearchTestHelper.createTestPleromaApiSearchResult(
        seed: seed,
      ),
    );
  });

  test('PleromaApiSearch toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiSearchTestHelper.createTestPleromaApiSearchResult(
        seed: seed,
      ),
      PleromaApiSearchResult.fromJson,
    );
  });
}
