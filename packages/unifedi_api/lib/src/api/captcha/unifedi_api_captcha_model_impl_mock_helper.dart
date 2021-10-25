import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'type/unifedi_api_captcha_type_model_mock_helper.dart';
import 'unifedi_api_captcha_model_impl.dart';

class UnifediApiCaptchaMockHelper {
  static UnifediApiCaptcha generate({
    required String seed,
  }) =>
      UnifediApiCaptcha(
        secondsValid:
            DurationMockHelper.generate(seed: seed + 'secondsValid').inSeconds,
        token: seed + 'token',
        answerData: seed + 'answerData',
        type: UnifediApiCaptchaTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        url: seed + 'url',
      );
}
