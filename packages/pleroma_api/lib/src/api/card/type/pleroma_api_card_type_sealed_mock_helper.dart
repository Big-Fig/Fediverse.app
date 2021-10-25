import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_card_type_sealed.dart';

abstract class PleromaApiCardTypeMockHelper {
  static PleromaApiCardType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiCardType.values,
      );
}
