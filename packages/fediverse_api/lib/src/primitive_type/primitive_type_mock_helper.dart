// ignore_for_file: no-magic-number
import 'dart:math';

class IntMockHelper {
  static int generate({
    required String? seed,
    int max = 2 ^ 53 - 1,
  }) {
    var random = Random(seed.hashCode);

    return random.nextInt(max);
  }
}

class BoolMockHelper {
  static bool generate({
    required String? seed,
  }) {
    var random = Random(seed.hashCode);

    return random.nextBool();
  }
}

class DoubleMockHelper {
  static double generate({
    required String? seed,
  }) {
    var random = Random(seed.hashCode);

    return random.nextDouble();
  }
}
