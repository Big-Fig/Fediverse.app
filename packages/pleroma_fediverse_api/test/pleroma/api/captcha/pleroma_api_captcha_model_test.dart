import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/captcha/pleroma_api_captcha_test_helper.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

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
