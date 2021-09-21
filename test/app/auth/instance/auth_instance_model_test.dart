// import 'package:fediverse_api/fediverse_api.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import '../../../hive/hive_test_helper.dart';
// import '../../../json/json_test_helper.dart';
// import '../../../obj/obj_test_helper.dart';
// import 'auth_instance_model_test_helper.dart';
// import 'package:unifedi_api/unifedi_api.dart';
// import 'package:fediverse_api/fediverse_api.dart';
//
// void main() {
//   test('equal & hashcode & toString', () async {
//     ObjMockHelper.testEqualsHashcodeToString(
//       ({required String seed}) =>
//           UnifediApiAccessModelMockHelper.createTestUnifediApiAccess(
//         seed: seed,
//       ),
//     );
//   });
//
//   test('toJson & fromJson', () async {
//     JsonMockHelper.testFromJsonToJson(
//       ({required String seed}) =>
//           UnifediApiAccessModelMockHelper.createTestUnifediApiAccess(
//         seed: seed,
//       ),
//       (json) =>UnifediApiAccess.fromJson(json),
//     );
//   });
//
//   test('hive save&load', () async {
//     await HiveMockHelper.testHiveSaveAndLoad(
//       ({required String seed}) =>
//           UnifediApiAccessModelMockHelper.createTestUnifediApiAccess(
//         seed: seed,
//       ),
//     );
//   });
//
//   test('copyWith', () async {
//     var obj1 = UnifediApiAccessModelMockHelper.createTestUnifediApiAccess(
//       seed: 'seed1',
//     );
//     var obj2 = UnifediApiAccessModelMockHelper.createTestUnifediApiAccess(
//       seed: 'seed2',
//     );
//
//     var obj2Obj1CopyWith = obj1.copyWith(
//       urlSchema: obj2.urlSchema,
//       urlHost: obj2.urlHost,
//       acct: obj2.acct,
//       token: obj2.token,
//       authCode: obj2.authCode,
//       isPleroma: obj2.isPleroma,
//       application: obj2.application,
//       info: obj2.info,
//     );
//
//     expect(obj1 == obj2, false);
//     expect(obj2, obj2Obj1CopyWith);
//     expect(obj1, obj1.copyWith());
//   });
//
//   test('hive adapter', () async {
//     HiveMockHelper.testAdapter(
//       () => UnifediApiAccessAdapter(),
//     );
//   });
// }
