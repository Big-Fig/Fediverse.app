import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'mastodon_api_media_attachment_type_sealed.dart';

abstract class MastodonApiMediaAttachmentTypeMockHelper {
  static MastodonApiMediaAttachmentType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiMediaAttachmentType.values,
      );
}
