// ignore_for_file: no-magic-number, no-equal-arguments
import '../federation/pleroma_api_instance_federation_model_impl_mock_helper.dart';
import '../limits/field/pleroma_api_instance_field_limits_model_impl_mock_helper.dart';
import 'pleroma_api_instance_metadata_model_impl.dart';

class PleromaApiInstanceMetadataMockHelper {
  static PleromaApiInstanceMetadata generate({
    required String seed,
  }) =>
      PleromaApiInstanceMetadata(
        features: [
          seed + 'feature1',
          seed + 'feature2',
        ],
        federation: PleromaApiInstanceFederationMockHelper.generate(
          seed: seed,
        ),
        postFormats: [
          seed + 'postFormat1',
          seed + 'postFormat2',
        ],
        accountActivationRequired: seed.hashCode % 2 == 0,
        fieldsLimits: PleromaApiInstanceFieldLimitsMockHelper.generate(
          seed: seed,
        ),
      );
}
