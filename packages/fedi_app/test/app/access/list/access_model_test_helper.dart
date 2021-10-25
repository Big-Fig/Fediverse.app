import 'package:fedi_app/app/access/list/access_list_model.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

// ignore_for_file: no-magic-number
class UnifediApiAccessListModelMockHelper {
  static AccessList createTestUnifediApiAccessList({
    required String seed,
  }) =>
      AccessList(
        instances: [
          UnifediApiAccessMockHelper.generate(seed: seed + '1'),
          UnifediApiAccessMockHelper.generate(seed: seed + '2'),
        ],
      );
}
