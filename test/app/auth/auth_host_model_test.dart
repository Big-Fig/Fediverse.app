import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../obj/obj_test_helper.dart';
import 'auth_host_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: seed,
      ),
    );
  });

  test('approvalRequired', () async {
    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        pleromaApiInstance: PleromaApiInstance.only(
          approvalRequired: true,
        ),
      ).approvalRequired,
      true,
    );
    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        pleromaApiInstance: PleromaApiInstance.only(
          approvalRequired: null,
        ),
      ).approvalRequired,
      false,
    );
    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        pleromaApiInstance: PleromaApiInstance.only(
          approvalRequired: false,
        ),
      ).approvalRequired,
      false,
    );
  });

  test('isPossibleToLogin', () async {
    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        pleromaApiInstance: PleromaApiInstance.only(
          approvalRequired: false,
        ),
      ).isPossibleToLogin,
      true,
    );

    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        unknownHostException: Exception(),
      ).isPossibleToLogin,
      false,
    );

    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        pleromaApiInstance: PleromaApiInstance.only(
          approvalRequired: true,
        ),
      ).isPossibleToLogin,
      false,
    );
  });

  test('emailConfirmationRequired', () async {
    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        emailConfirmationRequiredAuthHostException: null,
      ).emailConfirmationRequired,
      false,
    );

    expect(
      AuthHostModelTestHelper.createTestAuthHostRegistrationResult(
        seed: "seed",
        emailConfirmationRequiredAuthHostException:
            const EmailConfirmationRequiredAuthHostException(),
      ).emailConfirmationRequired,
      true,
    );
  });
}
