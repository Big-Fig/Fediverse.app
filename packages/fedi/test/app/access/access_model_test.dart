// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:flutter_test/flutter_test.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

import '../../hive/hive_test_helper.dart';
import '../../json/json_test_helper.dart';
import '../../obj/obj_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) => UnifediApiAccessMockHelper.generate(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) => UnifediApiAccessMockHelper.generate(
        seed: seed,
      ),
      (json) => UnifediApiAccess.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) => UnifediApiAccessMockHelper.generate(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = UnifediApiAccessMockHelper.generate(
      seed: 'seed1',
    );
    var obj2 = UnifediApiAccessMockHelper.generate(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      url: obj2.url,
      instance: obj2.instance,
      applicationAccessToken: obj2.applicationAccessToken,
      userAccessToken: obj2.userAccessToken,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => UnifediApiAccessAdapter(),
    );
  });
}
