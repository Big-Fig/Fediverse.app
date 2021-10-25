import '../../../field/pleroma_api_field_model_impl_mock_helper.dart';
import 'pleroma_api_my_account_source_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments

class PleromaApiMyAccountSourcePleromaPartMockHelper {
  static PleromaApiMyAccountSourcePleromaPart generate({
    required String seed,
  }) =>
      PleromaApiMyAccountSourcePleromaPart(
        noRichText: seed.hashCode % 2 == 1,
        showRole: seed.hashCode % 2 == 0,
        discoverable: seed.hashCode % 2 == 1,
        actorType: seed + 'actorType',
      );
}

class PleromaApiMyAccountSourceMockHelper {
  static PleromaApiMyAccountSource generate({
    required String seed,
  }) =>
      PleromaApiMyAccountSource(
        pleroma: PleromaApiMyAccountSourcePleromaPartMockHelper.generate(
          seed: seed,
        ),
        followRequestsCount: seed.hashCode + 1,
        fields: [
          PleromaApiFieldMockHelper.generate(seed: seed + '1'),
          PleromaApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        note: seed + 'note',
        privacy: seed + 'privacy',
        language: seed + 'language',
        sensitive: seed.hashCode % 2 == 1,
      );
}
