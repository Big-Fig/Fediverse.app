// ignore_for_file: no-magic-number
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiListTestHelper {
  static PleromaApiList createTestPleromaApiList({
    required String seed,
  }) =>
      PleromaApiList(
        title: seed + 'title',
        id: seed + 'id',
      );
}
