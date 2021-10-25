import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_card_type_sealed.dart';

abstract class UnifediApiCardTypeMockHelper {
  static UnifediApiCardType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiCardType.values,
      );
}
