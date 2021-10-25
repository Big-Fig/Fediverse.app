// ignore_for_file: no-magic-number, no-equal-arguments
import 'pleroma_api_instance_federation_mfr_object_age_model_impl.dart';

class PleromaApiInstanceFederationMfrObjectAgeMockHelper {
  static PleromaApiInstanceFederationMfrObjectAge generate({
    required String seed,
  }) =>
      PleromaApiInstanceFederationMfrObjectAge(
        threshold: seed.hashCode + 1,
        actions: [
          seed + '1',
          seed + '2',
        ],
      );
}
