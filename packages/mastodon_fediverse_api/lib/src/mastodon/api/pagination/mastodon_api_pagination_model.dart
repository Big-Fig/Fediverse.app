import 'package:base_fediverse_api/base_fediverse_api.dart';

abstract class IMastodonApiPaginationRequest {
  String? get maxId;

  String? get minId;

  String? get sinceId;

  int? get limit;

  List<RestRequestQueryArg> toQueryArgs();
}
