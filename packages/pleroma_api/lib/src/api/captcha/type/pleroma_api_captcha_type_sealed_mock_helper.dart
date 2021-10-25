import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_captcha_type_sealed.dart';

abstract class PleromaApiCaptchaTypeMockHelper {
  static PleromaApiCaptchaType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiCaptchaType.values,
      );
}
