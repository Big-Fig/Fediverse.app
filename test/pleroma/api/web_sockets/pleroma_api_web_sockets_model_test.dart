import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = PleromaApiWebSocketsEventType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiWebSocketsEventType();

      expect(value, objFromJsonValue);
    }
  });
}
