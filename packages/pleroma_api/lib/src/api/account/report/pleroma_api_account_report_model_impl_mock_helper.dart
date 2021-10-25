import '../../status/pleroma_api_status_model_impl_mock_helper.dart';
import '../pleroma_api_account_model_impl_mock_helper.dart';
import 'pleroma_api_account_report_model_impl.dart';

abstract class PleromaApiAccountReportMockHelper {
  static PleromaApiAccountReport generate({
    required String seed,
  }) =>
      PleromaApiAccountReport(
        account: PleromaApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        statuses: [
          PleromaApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        user: PleromaApiAccountMockHelper.generate(seed: seed + 'user'),
      );
}
