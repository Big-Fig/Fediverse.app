// ignore_for_file: no-magic-number
import 'meta/pleroma_api_media_attachment_meta_model_impl_mock_helper.dart';
import 'pleroma_api_media_attachment_model_impl.dart';
import 'type/pleroma_api_media_attachment_type_sealed_mock_helper.dart';

class PleromaApiMediaAttachmentMockHelper {
  static PleromaApiMediaAttachment generate({
    required String seed,
  }) =>
      PleromaApiMediaAttachment(
        blurhash: seed + 'blurhash',
        description: seed + 'desc',
        id: seed + 'id',
        previewUrl: seed + 'previewUrl',
        remoteUrl: seed + 'remoteUrl',
        textUrl: seed + 'textUrl',
        type: PleromaApiMediaAttachmentTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        url: seed + 'url',
        meta: PleromaApiMediaAttachmentMetaMockHelper.generate(
          seed: seed + 'meta',
        ),
        pleroma: PleromaApiMediaAttachmentPleromaPartMockHelper.generate(
          seed: seed + 'pleroma',
        ),
      );
}

class PleromaApiMediaAttachmentPleromaPartMockHelper {
  static PleromaApiMediaAttachmentPleromaPart generate({
    required String seed,
  }) =>
      PleromaApiMediaAttachmentPleromaPart(
        mimeType: seed + 'mimeType',
      );
}
