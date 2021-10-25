// ignore_for_file: no-magic-number
import 'type/unifedi_api_card_type_sealed_sealed_mock_helper.dart';

import 'unifedi_api_card_model_impl.dart';

class UnifediApiCardMockHelper {
  static UnifediApiCard generate({
    required String seed,
  }) =>
      UnifediApiCard(
        authorName: seed + 'authorName',
        authorUrl: seed + 'authorUrl',
        description: seed + 'description',
        embedUrl: seed + 'embedUrl',
        height: seed.hashCode % 3,
        width: seed.hashCode % 5,
        html: seed + 'html',
        image: seed + 'image',
        providerName: seed + 'providerName',
        providerUrl: seed + 'providerUrl',
        title: seed + 'title',
        type: UnifediApiCardTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        url: seed + 'url',
      );
}
