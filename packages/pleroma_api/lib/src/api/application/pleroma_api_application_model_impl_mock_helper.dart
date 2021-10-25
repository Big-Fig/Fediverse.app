import 'pleroma_api_application_model_impl.dart';

abstract class PleromaApiApplicationMockHelper {
  static PleromaApiApplication generate({
    required String seed,
  }) =>
      PleromaApiApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
      );
}
