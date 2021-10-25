// ignore_for_file: no-magic-number
import 'meta/unifedi_api_media_attachment_meta_model_impl_mock_helper.dart';
import 'type/unifedi_api_media_attachment_type_sealed_mock_helper.dart';
import 'unifedi_api_media_attachment_model_impl.dart';

class UnifediApiMediaAttachmentMockHelper {
  static UnifediApiMediaAttachment generate({
    required String seed,
  }) =>
      UnifediApiMediaAttachment(
        blurhash: seed + 'blurhash',
        description: seed + 'desc',
        id: seed + 'id',
        previewUrl: seed + 'previewUrl',
        remoteUrl: seed + 'remoteUrl',
        textUrl: seed + 'textUrl',
        type: UnifediApiMediaAttachmentTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        url: seed + 'url',
        meta: UnifediApiMediaAttachmentMetaMockHelper.generate(
          seed: seed + 'meta',
        ),
        mimeType: seed + 'mimeType',
      );
}
