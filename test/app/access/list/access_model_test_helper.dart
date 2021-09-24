import 'package:fedi/app/access/list/access_list_model.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

// ignore_for_file: no-magic-number
class UnifediApiAccessListModelMockHelper {
  static UnifediApiAccessList createTestUnifediApiAccessList({
    required String seed,
  }) =>
      UnifediApiAccessList(instances: [
        UnifediApiAccessMockHelper.generate(seed: seed + '1'),
        UnifediApiAccessMockHelper.generate(seed: seed + '2'),
      ]);
}
