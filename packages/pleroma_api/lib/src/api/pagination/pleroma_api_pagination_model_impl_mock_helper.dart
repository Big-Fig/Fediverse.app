// ignore_for_file: no-magic-number
import 'pleroma_api_pagination_model_impl.dart';

class PleromaApiPaginationMockHelper {
  static PleromaApiPagination generate({
    required String seed,
  }) =>
      PleromaApiPagination(
        limit: seed.hashCode,
        maxId: seed + 'maxId',
        minId: seed + 'minId',
        sinceId: seed + 'sinceId',
      );
}
