// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/content/pleroma_api_content_model.dart';

class PleromaApiContentTestHelper {
  static PleromaApiContent createTestPleromaApiContent({
    required String seed,
  }) =>
      PleromaApiContent(
        textPlain: seed + "textPlain",
      );
}
