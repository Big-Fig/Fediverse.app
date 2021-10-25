import 'unifedi_api_client_application_model_impl.dart';

abstract class UnifediApiClientApplicationMockHelper {
  static UnifediApiClientApplication generate({
    required String seed,
  }) =>
      UnifediApiClientApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
        clientSecret: seed + 'clientSecret',
        clientId: seed + 'clientId',
      );
}
