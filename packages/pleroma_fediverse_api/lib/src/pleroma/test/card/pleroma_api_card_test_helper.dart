// ignore_for_file: no-magic-number
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

import '../../../enum/enum_test_helper.dart';

class PleromaApiCardTestHelper {
  static PleromaApiCard createTestPleromaApiCard({
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
        type: EnumTestHelper.createTestEnum(
          seed: seed,
          values: MastodonApiCardType.values,
        ).toJsonValue(),
        url: seed + 'url',
      );
}
