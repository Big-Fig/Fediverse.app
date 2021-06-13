import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';

import '../auth_instance_model_test_helper.dart';

// ignore_for_file: no-magic-number
class AuthInstanceListModelTestHelper {
  static AuthInstanceList createTestAuthInstanceList({
    required String seed,
  }) =>
      AuthInstanceList(instances: [
        AuthInstanceModelTestHelper.createTestAuthInstance(seed: seed + '1'),
        AuthInstanceModelTestHelper.createTestAuthInstance(seed: seed + '2'),
      ]);
}
