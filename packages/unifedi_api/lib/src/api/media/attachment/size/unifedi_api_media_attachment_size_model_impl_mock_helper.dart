// ignore_for_file: no-magic-number
import 'unifedi_api_media_attachment_size_model_impl.dart';

class UnifediApiMediaAttachmentSizeMockHelper {
  static UnifediApiMediaAttachmentSize generate({
    required String seed,
  }) =>
      UnifediApiMediaAttachmentSize(
        width: seed.hashCode + 1,
        height: seed.hashCode + 2,
        size: seed + 'size',
        aspect: seed.hashCode / 3,
      );
}
