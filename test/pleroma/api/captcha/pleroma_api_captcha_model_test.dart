import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = PleromaApiCaptchaType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiCaptchaType();

      expect(value, objFromJsonValue);
    }
  });
}
