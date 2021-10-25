import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_pagination_model.dart';

part 'pleroma_api_pagination_model_impl.freezed.dart';

part 'pleroma_api_pagination_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiPagination
    with _$PleromaApiPagination
    implements IPleromaApiPagination {
  const factory PleromaApiPagination({
    @HiveField(0) required int? limit,
    @HiveField(1) @JsonKey(name: 'max_id') required String? maxId,
    @HiveField(2) @JsonKey(name: 'min_id') required String? minId,
    @HiveField(3) @JsonKey(name: 'since_id') required String? sinceId,
  }) = _PleromaApiPagination;

  factory PleromaApiPagination.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiPaginationFromJson(json);
}

extension PleromaApiPaginationInterfaceExtension on IPleromaApiPagination {
  PleromaApiPagination toPleromaApiPagination({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPagination(
          limit: limit,
          maxId: maxId,
          minId: minId,
          sinceId: sinceId,
        ),
        forceNewObject: forceNewObject,
      );
}
