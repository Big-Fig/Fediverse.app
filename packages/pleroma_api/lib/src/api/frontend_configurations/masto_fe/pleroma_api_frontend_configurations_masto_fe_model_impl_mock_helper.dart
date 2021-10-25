// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_frontend_configurations_masto_fe_model_impl.dart';

class PleromaApiFrontendConfigurationsMastoFeMockHelper {
  static PleromaApiFrontendConfigurationsMastoFe generate({
    required String seed,
  }) =>
      PleromaApiFrontendConfigurationsMastoFe(
        showInstanceSpecificPanel: BoolMockHelper.generate(
          seed: seed + 'showInstanceSpecificPanel',
        ),
      );
}
