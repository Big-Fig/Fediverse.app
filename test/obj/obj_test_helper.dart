import 'package:flutter_test/flutter_test.dart';

class ObjTestHelper {
  static void testEqualsHashcodeToString<T>(
    T Function({
      required String seed,
    })
        testObjectCreator,
  ) {
    var obj1 = testObjectCreator(seed: "seed1");
    var obj1copy = testObjectCreator(seed: "seed1");
    var obj2 = testObjectCreator(seed: "seed2");

    expect(obj1 == obj1copy, true);
    expect(obj1 == obj2, false);
    expect(obj1.hashCode == obj1copy.hashCode, true);
    expect(obj1.hashCode == obj2.hashCode, false);
    expect(obj1.toString() == obj1copy.toString(), true);
    expect(obj1.toString() == obj2.toString(), false);
  }
}
