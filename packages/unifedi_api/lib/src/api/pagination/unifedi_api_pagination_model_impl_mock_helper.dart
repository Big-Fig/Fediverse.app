// ignore_for_file: no-magic-number
import 'unifedi_api_pagination_model_impl.dart';

class UnifediApiPaginationMockHelper {
  static UnifediApiPagination generate({
    required String seed,
  }) =>
      UnifediApiPagination(
        limit: seed.hashCode,
        maxId: seed + 'maxId',
        minId: seed + 'minId',
        // sinceId: seed + 'sinceId',
      );
}
