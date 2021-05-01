import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_pagination_model.g.dart';

abstract class IPleromaApiPaginationRequest
    implements IMastodonApiPaginationRequest {
  List<RestRequestQueryArg> toQueryArgs();
}

@JsonSerializable()
class PleromaApiPaginationRequest implements IPleromaApiPaginationRequest {
  @override
  final int? limit;
  @override
  @JsonKey(name: "max_id")
  final String? maxId;
  @override
  @JsonKey(name: "min_id")
  final String? minId;
  @override
  @JsonKey(name: "since_id")
  final String? sinceId;

  PleromaApiPaginationRequest({
    this.limit,
    this.maxId,
    this.minId,
    this.sinceId,
  });

  @override
  List<RestRequestQueryArg> toQueryArgs() {
    return [
      if (minId != null)
        RestRequestQueryArg(
          key: "min_id",
          value: minId,
        ),
      if (maxId != null)
        RestRequestQueryArg(
          key: "max_id",
          value: maxId,
        ),
      if (sinceId != null)
        RestRequestQueryArg(
          key: "since_id",
          value: sinceId,
        ),
      if (limit != null)
        RestRequestQueryArg(
          key: "limit",
          value: limit.toString(),
        ),
    ];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPaginationRequest &&
          runtimeType == other.runtimeType &&
          limit == other.limit &&
          maxId == other.maxId &&
          minId == other.minId &&
          sinceId == other.sinceId;

  @override
  int get hashCode =>
      limit.hashCode ^ maxId.hashCode ^ minId.hashCode ^ sinceId.hashCode;

  @override
  String toString() {
    return 'PleromaApiPaginationRequest{'
        'limit: $limit, '
        'maxId: $maxId, '
        'minId: $minId, '
        'sinceId: $sinceId'
        '}';
  }
}
