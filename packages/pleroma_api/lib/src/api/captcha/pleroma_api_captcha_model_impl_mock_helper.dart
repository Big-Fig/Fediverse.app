import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_captcha_model_impl.dart';
import 'type/pleroma_api_captcha_type_sealed_mock_helper.dart';

class PleromaApiCaptchaMockHelper {
  static PleromaApiCaptcha generate({
    required String seed,
  }) =>
      PleromaApiCaptcha(
        secondsValid:
            DurationMockHelper.generate(seed: seed + 'secondsValid').inSeconds,
        token: seed + 'token',
        answerData: seed + 'answerData',
        type: PleromaApiCaptchaTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        url: seed + 'url',
      );
}
