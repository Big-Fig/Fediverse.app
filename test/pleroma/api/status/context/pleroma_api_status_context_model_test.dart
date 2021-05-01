import 'package:fedi/pleroma/api/status/context/pleroma_api_status_context_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'pleroma_api_status_context_test_helper.dart';

void main() {
  test('PleromaApiStatusContext equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiStatusContextTestHelper.createTestPleromaApiStatusContext(
        seed: seed,
      ),
    );
  });

  test('PleromaApiStatusContext toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiStatusContextTestHelper.createTestPleromaApiStatusContext(
        seed: seed,
      ),
      PleromaApiStatusContext.fromJson,
    );
  });
}
