// ignore_for_file: no-magic-number
import 'unifedi_api_frontend_configurations_model_impl.dart';

class UnifediApiFrontendConfigurationsMockHelper {
  static UnifediApiFrontendConfigurations generate({
    required String seed,
  }) =>
      UnifediApiFrontendConfigurations(
        brandHexColor: seed + 'brandHexColor',
        backgroundImage: seed + 'backgroundImage',
      );
}
