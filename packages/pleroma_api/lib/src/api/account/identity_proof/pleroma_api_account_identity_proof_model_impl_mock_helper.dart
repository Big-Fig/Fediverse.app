import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_account_identity_proof_model_impl.dart';

abstract class PleromaApiAccountIdentityProofMockHelper {
  static PleromaApiAccountIdentityProof generate({
    required String seed,
  }) =>
      PleromaApiAccountIdentityProof(
        profileUrl: seed + 'profileUrl',
        proofUrl: seed + 'proofUrl',
        provider: seed + 'provider',
        providerUsername: seed + 'providerUsername',
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
      );
}
