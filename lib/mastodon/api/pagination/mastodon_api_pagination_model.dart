abstract class IMastodonApiPaginationRequest {
  String? get maxId;

  String? get minId;

  String? get sinceId;

  int? get limit;
}
