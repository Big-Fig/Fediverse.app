import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = WebSocketsHandlingType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toWebSocketsHandlingType();

      expect(value, objFromJsonValue);
    }
  });
}
