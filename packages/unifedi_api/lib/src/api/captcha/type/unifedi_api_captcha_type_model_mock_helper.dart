import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_captcha_type_sealed.dart';

abstract class UnifediApiCaptchaTypeMockHelper {
  static UnifediApiCaptchaType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiCaptchaType.values,
      );
}
