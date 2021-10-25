import 'package:fediverse_api/fediverse_api_utils.dart';

abstract class IMastodonApiPagination {
  String? get maxId;

  String? get minId;

  String? get sinceId;

  int? get limit;
}

extension IMastodonApiPaginationRequestQueryArgsExtension
    on IMastodonApiPagination {
  List<UrlQueryArg> toQueryArgs() {
    var minId = this.minId;
    var maxId = this.maxId;
    var sinceId = this.sinceId;
    var limit = this.limit;

    return [
      if (minId != null)
        UrlQueryArg(
          key: 'min_id',
          value: minId,
        ),
      if (maxId != null)
        UrlQueryArg(
          key: 'max_id',
          value: maxId,
        ),
      if (sinceId != null)
        UrlQueryArg(
          key: 'since_id',
          value: sinceId,
        ),
      if (limit != null)
        UrlQueryArg(
          key: 'limit',
          value: limit.toString(),
        ),
    ];
  }
}
