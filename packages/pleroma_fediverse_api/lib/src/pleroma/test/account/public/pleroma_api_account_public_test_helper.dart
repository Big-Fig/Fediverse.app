// ignore_for_file: no-magic-number
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiAccountPublicTestHelper {
  static PleromaApiAccountPublicRegisterRequest
      createTestPleromaApiAccountRegisterRequest({
    required String seed,
  }) =>
          PleromaApiAccountPublicRegisterRequest(
            agreement: seed.hashCode % 2 == 0,
            email: seed + 'email',
            locale: seed + 'locale',
            password: seed + 'password',
            reason: seed + 'reason',
            username: seed + 'username',
            captchaToken: seed + 'captchaToken',
            captchaAnswerData: seed + 'captchaAnswerData',
            captchaSolution: seed + 'captchaSolution',
          );
}
