// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'pleroma_api_media_attachment_focus_model_impl.dart';

class PleromaApiMediaAttachmentFocusMockHelper {
  static PleromaApiMediaAttachmentFocus generate({
    required String seed,
  }) =>
      PleromaApiMediaAttachmentFocus(
        x: IntMockHelper.generate(seed: seed + 'x', max: 4) / 2 - 1,
        y: IntMockHelper.generate(seed: seed + 'y', max: 4) / 2 - 1,
      );
}
