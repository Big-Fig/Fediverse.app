// ignore_for_file: no-magic-number, no-equal-arguments

import 'unifedi_api_instance_media_limits_model_impl.dart';

class UnifediApiInstanceMediaLimitsMockHelper {
  static UnifediApiInstanceMediaLimits generate({
    required String seed,
  }) =>
      UnifediApiInstanceMediaLimits(
        uploadLimit: seed.hashCode + 1,
        avatarUploadLimit: seed.hashCode + 2,
        backgroundUploadLimit: seed.hashCode + 3,
        bannerUploadLimit: seed.hashCode + 4,
        descriptionLimit: seed.hashCode + 5,
      );
}
