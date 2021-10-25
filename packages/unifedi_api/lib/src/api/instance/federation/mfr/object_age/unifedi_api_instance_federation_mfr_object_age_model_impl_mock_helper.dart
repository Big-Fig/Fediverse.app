// ignore_for_file: no-magic-number, no-equal-arguments
import 'unifedi_api_instance_federation_mfr_object_age_model_impl.dart';

class UnifediApiInstanceFederationMfrObjectAgeMockHelper {
  static UnifediApiInstanceFederationMfrObjectAge generate({
    required String seed,
  }) =>
      UnifediApiInstanceFederationMfrObjectAge(
        threshold: seed.hashCode + 1,
        actions: [
          seed + '1',
          seed + '2',
        ],
      );
}
