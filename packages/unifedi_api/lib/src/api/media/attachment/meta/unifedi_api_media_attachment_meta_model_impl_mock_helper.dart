// ignore_for_file: no-magic-number
import '../focus/unifedi_api_media_attachment_focus_model_impl_mock_helper.dart';
import '../size/unifedi_api_media_attachment_size_model_impl_mock_helper.dart';
import 'unifedi_api_media_attachment_meta_model_impl.dart';

class UnifediApiMediaAttachmentMetaMockHelper {
  static UnifediApiMediaAttachmentMeta generate({
    required String seed,
  }) =>
      UnifediApiMediaAttachmentMeta(
        focus: UnifediApiMediaAttachmentFocusMockHelper.generate(
          seed: seed + 'focus',
        ),
        original: UnifediApiMediaAttachmentSizeMockHelper.generate(
          seed: seed + 'original',
        ),
        small: UnifediApiMediaAttachmentSizeMockHelper.generate(
          seed: seed + 'small',
        ),
      );
}
