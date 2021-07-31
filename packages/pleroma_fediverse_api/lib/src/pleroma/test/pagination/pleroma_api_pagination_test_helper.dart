// ignore_for_file: no-magic-number
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiPaginationTestHelper {
  static PleromaApiPaginationRequest createTestPleromaApiPaginationRequest({
    required String seed,
  }) =>
      PleromaApiPaginationRequest(
        limit: seed.hashCode,
        maxId: seed + 'maxId',
        minId: seed + 'minId',
        sinceId: seed + 'sinceId',
      );
}
