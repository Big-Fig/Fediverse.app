// ignore_for_file: no-magic-number
import 'pleroma_api_card_model_impl.dart';
import 'type/pleroma_api_card_type_sealed_mock_helper.dart';

class PleromaApiCardMockHelper {
  static PleromaApiCard generate({
    required String seed,
  }) =>
      PleromaApiCard(
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
        type: PleromaApiCardTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        url: seed + 'url',
      );
}
