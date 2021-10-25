// ignore_for_file: no-magic-number, no-equal-arguments
import 'item/unifedi_api_instance_activity_item_model_impl_mock_helper.dart';
import 'unifedi_api_instance_activity_model_impl.dart';

class UnifediApiInstanceActivityMockHelper {
  static UnifediApiInstanceActivity generate({
    required String seed,
  }) =>
      UnifediApiInstanceActivity(
        items: [
          UnifediApiInstanceActivityItemMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiInstanceActivityItemMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
