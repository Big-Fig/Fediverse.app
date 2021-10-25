import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_media_attachment_type_sealed.dart';

abstract class UnifediApiMediaAttachmentTypeMockHelper {
  static UnifediApiMediaAttachmentType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiMediaAttachmentType.values,
      );
}
