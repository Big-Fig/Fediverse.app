// ignore_for_file: no-magic-number
import 'masto_fe/pleroma_api_frontend_configurations_masto_fe_model_impl_mock_helper.dart';
import 'pleroma_api_frontend_configurations_model_impl.dart';
import 'pleroma_fe/pleroma_api_frontend_configurations_pleroma_fe_model_impl_mock_helper.dart';
import 'soapbox_fe/pleroma_api_frontend_configurations_soapbox_fe_model_impl_mock_helper.dart';

class PleromaApiFrontendConfigurationsMockHelper {
  static PleromaApiFrontendConfigurations generate({
    required String seed,
  }) =>
      PleromaApiFrontendConfigurations(
        mastoFe: PleromaApiFrontendConfigurationsMastoFeMockHelper.generate(
          seed: seed + 'mastoFe',
        ),
        pleromaFe: PleromaApiFrontendConfigurationsPleromaFeMockHelper.generate(
          seed: seed + 'pleromaFe',
        ),
        soapboxFe: PleromaApiFrontendConfigurationsSoapboxFeMockHelper.generate(
          seed: seed + 'soapboxFe',
        ),
      );
}
