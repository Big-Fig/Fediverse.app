import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_web_sockets_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiWebSocketsEventType toJsonValue & fromJsonValue', () async {
    var values = PleromaApiWebSocketsEventType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiWebSocketsEventType();

      expect(value, objFromJsonValue);
    }
  });

  test('PleromaApiWebSocketsEvent equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiWebSocketsTestHelper.createTestPleromaApiWebSocketsEvent(
        seed: seed,
      ),
    );
  });

  test('PleromaApiWebSocketsEvent toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiWebSocketsTestHelper.createTestPleromaApiWebSocketsEvent(
        seed: seed,
      ),
      PleromaApiWebSocketsEvent.fromJson,
    );
  });
}
