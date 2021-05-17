import 'package:fedi/json/json_model.dart';
import 'package:flutter_test/flutter_test.dart';

class JsonTestHelper {
  static void testFromJsonToJson<T extends IJsonObject>(
    T Function({
      required String seed,
    })
        testObjectCreator,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    var obj = testObjectCreator(seed: 'seed1');

    var json = obj.toJson();

    var objFromJson = fromJson(json);

    expect(obj, objFromJson);
  }
}
