import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

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
