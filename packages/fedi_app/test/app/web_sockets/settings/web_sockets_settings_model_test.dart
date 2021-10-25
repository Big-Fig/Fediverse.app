import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'web_sockets_settings_model_test_helper.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      WebSocketsSettingsModelMockHelper.createTestWebSocketsSettings,
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      WebSocketsSettingsModelMockHelper.createTestWebSocketsSettings,
      (json) => WebSocketsSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      WebSocketsSettingsModelMockHelper.createTestWebSocketsSettings,
    );
  });

  test('copyWith', () async {
    var obj1 = WebSocketsSettingsModelMockHelper.createTestWebSocketsSettings(
      seed: 'seed1',
    );
    var obj2 = WebSocketsSettingsModelMockHelper.createTestWebSocketsSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      handlingTypeString: obj2.handlingTypeString,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => WebSocketsSettingsAdapter(),
    );
  });
}
