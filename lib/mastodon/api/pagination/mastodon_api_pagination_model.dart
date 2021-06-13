import 'package:fedi/rest/rest_request_model.dart';

abstract class IMastodonApiPaginationRequest {
  String? get maxId;

  String? get minId;

  String? get sinceId;

  int? get limit;

  List<RestRequestQueryArg> toQueryArgs();
}
