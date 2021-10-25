// ignore_for_file: no-magic-number, no-equal-arguments

import '../account/pleroma_api_account_model_impl_mock_helper.dart';
import 'limits/poll/pleroma_api_instance_poll_limits_model_impl_mock_helper.dart';
import 'metadata/pleroma_api_instance_metadata_model_impl_mock_helper.dart';
import 'pleroma_api_instance_model_impl.dart';

class PleromaApiInstanceMockHelper {
  static PleromaApiInstance generate({
    required String seed,
  }) =>
      PleromaApiInstance(
        approvalRequired: seed.hashCode % 2 == 0,
        avatarUploadLimit: seed.hashCode + 1,
        backgroundUploadLimit: seed.hashCode + 2,
        bannerUploadLimit: seed.hashCode + 3,
        contactAccount: PleromaApiAccountMockHelper.generate(seed: seed),
        email: seed + 'email',
        languages: [
          seed + 'lang1',
          seed + 'lang2',
        ],
        maxTootChars: seed.hashCode + 4,
        pleroma: PleromaApiInstancePleromaPartMockHelper.generate(
          seed: seed,
        ),
        pollLimits: PleromaApiInstancePollLimitsLimitsMockHelper.generate(
          seed: seed,
        ),
        registrations: seed.hashCode % 2 == 1,
        shortDescription: seed + 'shortDescription',
        thumbnail: seed + 'thumbnail',
        stats: null,
        title: seed + 'title',
        uploadLimit: seed.hashCode + 7,
        uri: seed + 'uri',
        urls: null,
        vapidPublicKey: seed + 'vapidPublicKey',
        versionString: seed + 'version',
        backgroundImage: seed + 'backgroundImage',
        chatLimit: seed.hashCode + 5,
        description: seed + 'description',
        descriptionLimit: seed.hashCode + 6,
        invitesEnabled: seed.hashCode % 2 == 0,
      );
}

class PleromaApiInstancePleromaPartMockHelper {
  static PleromaApiInstancePleromaPart generate({
    required String seed,
  }) =>
      PleromaApiInstancePleromaPart(
        metadata: PleromaApiInstanceMetadataMockHelper.generate(
          seed: seed,
        ),
      );
}
