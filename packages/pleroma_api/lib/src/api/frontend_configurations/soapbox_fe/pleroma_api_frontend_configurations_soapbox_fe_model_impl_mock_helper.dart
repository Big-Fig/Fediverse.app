// ignore_for_file: no-magic-number
import '../pleroma_api_frontend_configurations_model_impl.dart';

class PleromaApiFrontendConfigurationsSoapboxFeMockHelper {
  static PleromaApiFrontendConfigurationsSoapboxFe generate({
    required String seed,
  }) =>
      PleromaApiFrontendConfigurationsSoapboxFe(
        brandColor: seed + 'brandColor',
      );
}
