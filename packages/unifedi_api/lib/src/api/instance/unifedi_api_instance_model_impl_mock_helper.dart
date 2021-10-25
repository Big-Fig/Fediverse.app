// ignore_for_file: no-magic-number, no-equal-arguments

import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../account/unifedi_api_account_model_impl_mock_helper.dart';
import 'federation/unifedi_api_instance_federation_model_impl_mock_helper.dart';
import 'limits/unifedi_api_instance_limits_model_impl_mock_helper.dart';
import 'stats/unifedi_api_instance_stats_model_impl_mock_helper.dart';
import 'type/unifedi_api_instance_type_model.dart';
import 'unifedi_api_instance_model_impl.dart';
import 'urls/unifedi_api_instance_urls_model_impl_mock_helper.dart';

class UnifediApiInstanceMockHelper {
  static UnifediApiInstance generate({
    required String seed,
  }) =>
      UnifediApiInstance(
        // ignore: avoid-non-null-assertion
        type: EnumMockHelper.generate(
          seed: seed + 'type',
          values: UnifediApiInstanceType.values,
        ).stringValue!,
        versionString: seed + 'versionString',
        limits: UnifediApiInstanceLimitsMockHelper.generate(
          seed: seed + 'limits',
        ),
        vapidPublicKey: seed + 'vapidPublicKey',
        backgroundImage: seed + 'backgroundImage',
        contactAccount:
            UnifediApiAccountMockHelper.generate(seed: seed + 'contactAccount'),
        features: [
          seed + 'feature1',
          seed + 'feature2',
        ],
        postFormats: [
          seed + 'format1',
          seed + 'format2',
        ],
        accountActivationRequired: seed.hashCode % 2 == 0,
        federation: UnifediApiInstanceFederationMockHelper.generate(
          seed: seed + 'federation',
        ),
        urls: UnifediApiInstanceUrlsMockHelper.generate(
          seed: seed + 'urls',
        ),
        stats: UnifediApiInstanceStatsMockHelper.generate(
          seed: seed + 'stats',
        ),
        uri: seed + 'uri',
        title: seed + 'title',
        description: seed + 'description',
        invitesEnabled: seed.hashCode % 2 == 0,
        registrations: seed.hashCode % 2 == 1,
        shortDescription: seed + 'shortDescription',
        thumbnail: seed + 'thumbnail',
        email: seed + 'email',
        languages: [
          seed + 'lang1',
          seed + 'lang2',
        ],
        approvalRequired: seed.hashCode % 2 == 0,
      );
}
