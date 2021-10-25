import 'pleroma_api_client_application_model_impl.dart';

abstract class PleromaApiClientApplicationMockHelper {
  static PleromaApiClientApplication generate({
    required String seed,
  }) =>
      PleromaApiClientApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
        clientSecret: seed + 'clientSecret',
        clientId: seed + 'clientId',
      );
}
