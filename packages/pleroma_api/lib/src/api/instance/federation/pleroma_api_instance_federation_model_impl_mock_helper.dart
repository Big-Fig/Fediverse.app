// ignore_for_file: no-magic-number, no-equal-arguments
import 'mfr/object_age/pleroma_api_instance_federation_mfr_object_age_model_impl_mock_helper.dart';
import 'pleroma_api_instance_federation_model_impl.dart';

class PleromaApiInstanceFederationMockHelper {
  static PleromaApiInstanceFederation generate({
    required String seed,
  }) =>
      PleromaApiInstanceFederation(
        enabled: seed.hashCode % 2 == 0,
        exclusions: seed.hashCode % 2 == 1,
        mrfObjectAge:
            // ignore: lines_longer_than_80_chars
            PleromaApiInstanceFederationMfrObjectAgeMockHelper.generate(
          seed: seed,
        ),
        mrfPolicies: [
          seed + 'policy1',
          seed + 'policy2',
        ],
        quarantinedInstances: [
          seed + 'quarantinedInstance1',
          seed + 'quarantinedInstance2',
        ],
      );
}
