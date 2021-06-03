import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('isEnabled', () async {
    expect(WebSocketsHandlingType.disabled.isEnabled, false);
    expect(WebSocketsHandlingType.foregroundAndBackground.isEnabled, true);
    expect(WebSocketsHandlingType.onlyForeground.isEnabled, true);
  });

  test('toJsonValue & fromJsonValue', () async {
    var values = WebSocketsHandlingType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toWebSocketsHandlingType();

      expect(value, objFromJsonValue);
    }
  });

  test('toJsonStrings & fromJsonStrings', () async {
    var values = WebSocketsHandlingType.values;

    var jsonStrings = values.toJsonStrings();

    var valuesFromJson = jsonStrings.toWebSocketsHandlingTypes();

    expect(listEquals(values, valuesFromJson), true);
  });
  test('TypeConverter', () async {
    var typeConverter = WebSocketsHandlingTypeTypeConverter();
    var values = WebSocketsHandlingType.values;
    for (var value in values) {
      var jsonValue = typeConverter.toJson(value);

      var objFromJsonValue = typeConverter.fromJson(jsonValue);

      expect(value, objFromJsonValue);

      var sqlValue = typeConverter.mapToSql(value);

      var objFromSqlValue = typeConverter.mapToDart(sqlValue);

      expect(value, objFromSqlValue);
    }
  });
}
