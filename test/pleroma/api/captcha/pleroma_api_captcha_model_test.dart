import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_captcha_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiCaptchaType toPleromaApiCaptchaType', () async {
    var values = PleromaApiCaptchaType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiCaptchaType();

      expect(value, objFromJsonValue);
    }
  });

  test('PleromaApiCaptcha toPleromaApiCaptcha', () async {
    var original = PleromaApiCaptchaTestHelper.createTestPleromaApiCaptcha(
      seed: 'seed',
    );
    var obj = original.toPleromaApiCaptcha(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiCaptcha equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiCaptchaTestHelper.createTestPleromaApiCaptcha(
        seed: seed,
      ),
    );
  });

  test('PleromaApiCaptcha toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiCaptchaTestHelper.createTestPleromaApiCaptcha(
        seed: seed,
      ),
      PleromaApiCaptcha.fromJson,
    );
  });
}
