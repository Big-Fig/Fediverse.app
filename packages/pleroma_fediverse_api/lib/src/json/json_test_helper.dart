import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:test/test.dart';

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
