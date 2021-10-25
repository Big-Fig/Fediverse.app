// ignore_for_file: no-magic-number
import 'pleroma_api_media_attachment_size_model_impl.dart';

class PleromaApiMediaAttachmentSizeMockHelper {
  static PleromaApiMediaAttachmentSize generate({
    required String seed,
  }) =>
      PleromaApiMediaAttachmentSize(
        width: seed.hashCode + 1,
        height: seed.hashCode + 2,
        size: seed + 'size',
        aspect: seed.hashCode / 3,
      );
}
