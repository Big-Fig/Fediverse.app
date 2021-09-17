import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../obj/obj_test_helper.dart';
import 'auth_host_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: seed,
      ),
    );
  });

  test('approvalRequired', () async {
    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        unifediApiInstance: UnifediApiInstance.only(
          approvalRequired: true,
          uri: 'https://fedi.app',
          versionString: '1.0.0',
        ),
      ).approvalRequired,
      true,
    );
    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        unifediApiInstance: UnifediApiInstance.only(
          approvalRequired: null,
          uri: 'https://fedi.app',
          versionString: '1.0.0',
        ),
      ).approvalRequired,
      false,
    );
    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        unifediApiInstance: UnifediApiInstance.only(
          approvalRequired: false,
          uri: 'https://fedi.app',
          versionString: '1.0.0',
        ),
      ).approvalRequired,
      false,
    );
  });

  test('isPossibleToLogin', () async {
    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        unifediApiInstance: UnifediApiInstance.only(
          approvalRequired: false,
          uri: 'https://fedi.app',
          versionString: '1.0.0',
        ),
      ).isPossibleToLogin,
      true,
    );

    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        unknownHostException: Exception(),
      ).isPossibleToLogin,
      false,
    );

    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        unifediApiInstance: UnifediApiInstance.only(
          approvalRequired: true,
          uri: 'https://fedi.app',
          versionString: '1.0.0',
        ),
      ).isPossibleToLogin,
      false,
    );
  });

  test('emailConfirmationRequired', () async {
    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        emailConfirmationRequiredAuthHostException: null,
      ).emailConfirmationRequired,
      false,
    );

    expect(
      AuthHostModelMockHelper.createTestAuthHostRegistrationResult(
        seed: 'seed',
        emailConfirmationRequiredAuthHostException:
            const EmailConfirmationRequiredAuthHostException(),
      ).emailConfirmationRequired,
      true,
    );
  });
}
