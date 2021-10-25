import 'unifedi_api_application_model_impl.dart';

abstract class UnifediApiApplicationMockHelper {
  static UnifediApiApplication generate({
    required String seed,
  }) =>
      UnifediApiApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
      );
}
