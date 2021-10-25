import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/captcha/pleroma_api_captcha_model_impl.dart';
import 'package:pleroma_api/src/api/captcha/pleroma_api_captcha_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/captcha/type/pleroma_api_captcha_type_sealed.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test(
    'PleromaApiCaptchaType toPleromaApiCaptchaType',
    () async {
      var values = PleromaApiCaptchaType.values;
      for (final value in values) {
        var jsonValue = value.stringValue;

        var objFromJsonValue = jsonValue.toPleromaApiCaptchaType();

        expect(value, objFromJsonValue);
      }
    },
  );

  test('PleromaApiCaptcha toPleromaApiCaptcha', () async {
    var original = PleromaApiCaptchaMockHelper.generate(
      seed: 'seed',
    );
    var obj = original.toPleromaApiCaptcha(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiCaptcha equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiCaptchaMockHelper.generate,
    );
  });

  test('PleromaApiCaptcha toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiCaptchaMockHelper.generate,
      (json) => PleromaApiCaptcha.fromJson(json),
    );
  });
}
