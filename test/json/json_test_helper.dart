import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter_test/flutter_test.dart';

class JsonMockHelper {
  static void testFromJsonToJson<T extends IJsonObj>(
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
