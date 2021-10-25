// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi_app/app/search/recent/recent_search_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'recent_search_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          RecentSearchModelMockHelper.createTestRecentSearchList(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          RecentSearchModelMockHelper.createTestRecentSearchList(
        seed: seed,
      ),
      (json) => RecentSearchList.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          RecentSearchModelMockHelper.createTestRecentSearchList(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => RecentSearchListAdapter(),
    );
  });
}
