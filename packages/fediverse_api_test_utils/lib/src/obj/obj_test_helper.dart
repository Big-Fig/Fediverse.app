import 'package:test/test.dart';

class ObjTestHelper {
  static void testEqualsHashcodeToString<T>(
    T Function({
      required String seed,
    })
        testObjectCreator, {
    // sometimes we don't want test diff test because hashcode always same
    // for objects with 1 or 2 simple fields like bool
    bool skipHashCodeDiffTest = false,
  }) {
    var obj1 = testObjectCreator(seed: 'seed1');
    var obj1copy = testObjectCreator(seed: 'seed1');
    var obj2 = testObjectCreator(seed: 'seed2');

    expect(obj1 == obj1copy, true);
    expect(obj1 == obj2, false);
    expect(obj1.hashCode, obj1copy.hashCode);
    if (!skipHashCodeDiffTest) {
      expect(obj1.hashCode == obj2.hashCode, false);
    }
    expect(obj1.toString() == obj1copy.toString(), true);
    expect(obj1.toString() == obj2.toString(), false);
  }
}
