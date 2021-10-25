import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_pagination_model.dart';

part 'mastodon_api_pagination_model_impl.freezed.dart';

part 'mastodon_api_pagination_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiPagination
    with _$MastodonApiPagination
    implements IMastodonApiPagination {
  const factory MastodonApiPagination({
    @HiveField(0) required int? limit,
    @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
    @HiveField(2) @JsonKey(name: 'min_id') required String? minId,
    @HiveField(3) @JsonKey(name: 'since_id') required String? sinceId,
  }) = _MastodonApiPagination;

  factory MastodonApiPagination.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiPaginationFromJson(json);
}

extension MastodonApiPaginationInterfaceExtension on IMastodonApiPagination {
  MastodonApiPagination toMastodonApiPagination({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPagination(
          limit: limit,
          maxId: maxId,
          minId: minId,
          sinceId: sinceId,
        ),
        forceNewObject: forceNewObject,
      );
}
