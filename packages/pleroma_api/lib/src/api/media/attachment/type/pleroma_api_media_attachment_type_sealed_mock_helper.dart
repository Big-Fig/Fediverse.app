import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_media_attachment_type_sealed.dart';

abstract class PleromaApiMediaAttachmentTypeMockHelper {
  static PleromaApiMediaAttachmentType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiMediaAttachmentType.values,
      );
}
