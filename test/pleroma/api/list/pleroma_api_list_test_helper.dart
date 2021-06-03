// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';

class PleromaApiListTestHelper {
  static PleromaApiList createTestPleromaApiList({
    required String seed,
  }) =>
      PleromaApiList(
        title: seed + "title",
        id: seed + "id",
      );
}
