// ignore_for_file: no-magic-number
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiContentTestHelper {
  static PleromaApiContent createTestPleromaApiContent({
    required String seed,
  }) =>
      PleromaApiContent(
        textPlain: seed + 'textPlain',
      );
}
