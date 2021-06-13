import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_model.dart';

import '../../../duration/duration_test_helper.dart';
import '../../../enum/enum_test_helper.dart';

class PleromaApiCaptchaTestHelper {
  static PleromaApiCaptcha createTestPleromaApiCaptcha({
    required String seed,
  }) =>
      PleromaApiCaptcha(
        answerData: seed + 'answerData',
        secondsValid: DurationTestHelper.createTestDurationSeconds(seed: seed),
        token: seed + 'token',
        type: EnumTestHelper.createTestEnum(
          seed: seed,
          values: PleromaApiCaptchaType.values,
        ).toJsonValue(),
        url: seed + 'url',
      );
}
