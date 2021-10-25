import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_pagination_model.dart';

part 'unifedi_api_pagination_model_impl.freezed.dart';

part 'unifedi_api_pagination_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiPagination
    with _$UnifediApiPagination
    implements IUnifediApiPagination {
  const factory UnifediApiPagination({
    @HiveField(0) required int? limit,
    @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
    @HiveField(2) @JsonKey(name: 'min_id') required String? minId,
    // @HiveField(3) @JsonKey(name: 'since_id') required String? sinceId,
  }) = _UnifediApiPagination;

  factory UnifediApiPagination.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPaginationFromJson(json);
}

extension UnifediApiPaginationInterfaceExtension on IUnifediApiPagination {
  UnifediApiPagination toUnifediApiPagination({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPagination(
          limit: limit,
          maxId: maxId,
          minId: minId,
          // sinceId: sinceId,
        ),
        forceNewObject: forceNewObject,
      );
}
