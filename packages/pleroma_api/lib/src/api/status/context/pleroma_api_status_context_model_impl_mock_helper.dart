import '../pleroma_api_status_model_impl_mock_helper.dart';
import 'pleroma_api_status_context_model_impl.dart';

// ignore_for_file: no-magic-number
class PleromaApiStatusContextMockHelper {
  static PleromaApiStatusContext generate({
    required String seed,
  }) =>
      PleromaApiStatusContext(
        ancestors: [
          PleromaApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        descendants: [
          PleromaApiStatusMockHelper.generate(
            seed: seed + '3',
          ),
          PleromaApiStatusMockHelper.generate(
            seed: seed + '4',
          ),
        ],
      );
}
