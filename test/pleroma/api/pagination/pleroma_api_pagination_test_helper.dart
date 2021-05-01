// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';

class PleromaApiPaginationTestHelper {
  static PleromaApiPaginationRequest createTestPleromaApiPaginationRequest({
    required String seed,
  }) =>
      PleromaApiPaginationRequest(
        limit: seed.hashCode,
        maxId: seed + "maxId",
        minId: seed + "minId",
        sinceId: seed + "sinceId",
      );
}
