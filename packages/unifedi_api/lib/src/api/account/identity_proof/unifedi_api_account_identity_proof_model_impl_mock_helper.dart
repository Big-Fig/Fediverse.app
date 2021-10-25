import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'unifedi_api_account_identity_proof_model_impl.dart';

abstract class UnifediApiAccountIdentityProofMockHelper {
  static UnifediApiAccountIdentityProof generate({
    required String seed,
  }) =>
      UnifediApiAccountIdentityProof(
        profileUrl: seed + 'profileUrl',
        proofUrl: seed + 'proofUrl',
        provider: seed + 'provider',
        providerUsername: seed + 'providerUsername',
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
      );
}
