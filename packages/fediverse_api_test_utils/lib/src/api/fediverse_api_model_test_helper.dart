import 'package:fediverse_api/fediverse_api.dart';
import 'package:test/test.dart';

class FediverseApiModelTestHelper {
  static void testFromJsonToJson<T extends IFediverseApiObject>(
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
