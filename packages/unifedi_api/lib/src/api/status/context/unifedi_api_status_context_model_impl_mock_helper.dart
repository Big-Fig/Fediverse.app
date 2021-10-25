import '../unifedi_api_status_model_impl_mock_helper.dart';
import 'unifedi_api_status_context_model_impl.dart';

// ignore_for_file: no-magic-number
class UnifediApiStatusContextMockHelper {
  static UnifediApiStatusContext generate({
    required String seed,
  }) =>
      UnifediApiStatusContext(
        ancestors: [
          UnifediApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        descendants: [
          UnifediApiStatusMockHelper.generate(
            seed: seed + '3',
          ),
          UnifediApiStatusMockHelper.generate(
            seed: seed + '4',
          ),
        ],
      );
}
