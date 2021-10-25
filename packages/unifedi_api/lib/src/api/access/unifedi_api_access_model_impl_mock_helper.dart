import '../instance/unifedi_api_instance_model_impl_mock_helper.dart';
import 'token/application/unifedi_api_access_application_token_model_impl_mock_helper.dart';
import 'token/user/unifedi_api_access_user_token_model_impl_mock_helper.dart';
import 'unifedi_api_access_model_impl.dart';

class UnifediApiAccessMockHelper {
  static UnifediApiAccess generate({
    required String seed,
  }) =>
      UnifediApiAccess(
        url: seed + 'url',
        instance:
            UnifediApiInstanceMockHelper.generate(seed: seed + 'instance'),
        applicationAccessToken:
            UnifediApiAccessApplicationTokenMockHelper.generate(
          seed: seed + 'applicationAccessToken',
        ),
        userAccessToken: UnifediApiAccessUserTokenMockHelper.generate(
          seed: seed + 'userAccessToken',
        ),
      );
}
