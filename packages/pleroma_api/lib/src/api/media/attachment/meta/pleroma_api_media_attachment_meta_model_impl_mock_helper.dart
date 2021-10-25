// ignore_for_file: no-magic-number
import '../focus/pleroma_api_media_attachment_focus_model_impl_mock_helper.dart';
import '../size/pleroma_api_media_attachment_size_model_impl_mock_helper.dart';
import 'pleroma_api_media_attachment_meta_model_impl.dart';

class PleromaApiMediaAttachmentMetaMockHelper {
  static PleromaApiMediaAttachmentMeta generate({
    required String seed,
  }) =>
      PleromaApiMediaAttachmentMeta(
        focus: PleromaApiMediaAttachmentFocusMockHelper.generate(
          seed: seed + 'focus',
        ),
        original: PleromaApiMediaAttachmentSizeMockHelper.generate(
          seed: seed + 'original',
        ),
        small: PleromaApiMediaAttachmentSizeMockHelper.generate(
          seed: seed + 'small',
        ),
      );
}
