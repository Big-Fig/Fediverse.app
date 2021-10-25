import '../../status/unifedi_api_status_model_impl_mock_helper.dart';
import '../unifedi_api_account_model_impl_mock_helper.dart';
import 'unifedi_api_account_report_model_impl.dart';

abstract class UnifediApiAccountReportMockHelper {
  static UnifediApiAccountReport generate({
    required String seed,
  }) =>
      UnifediApiAccountReport(
        account: UnifediApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        statuses: [
          UnifediApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        user: UnifediApiAccountMockHelper.generate(seed: seed + 'user'),
      );
}
