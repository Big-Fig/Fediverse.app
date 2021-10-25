import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../pleroma_api_version_model_impl.dart';
import 'pleroma_api_version_range_model.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_version_range_model_impl.freezed.dart';

part 'pleroma_api_version_range_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiVersionRange
    with _$PleromaApiVersionRange
    implements IPleromaApiVersionRange {
  const factory PleromaApiVersionRange({
    @HiveField(0) required PleromaApiVersion? min,
    @HiveField(1) required PleromaApiVersion? max,
    @HiveField(2)
    @JsonKey(name: 'min_inclusive')
    @Default(true)
        bool minInclusive,
    @HiveField(3)
    @JsonKey(name: 'max_inclusive')
    @Default(false)
        bool maxInclusive,
  }) = _PleromaApiVersionRange;

  factory PleromaApiVersionRange.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiVersionRangeFromJson(json);
}

extension IPleromaApiVersionRangeInterfaceExtension on IPleromaApiVersionRange {
  PleromaApiVersionRange toPleromaApiVersionRange({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiVersionRange(
          min: min?.toPleromaApiVersion(forceNewObject: forceNewObject),
          max: max?.toPleromaApiVersion(forceNewObject: forceNewObject),
          minInclusive: minInclusive,
          maxInclusive: maxInclusive,
        ),
        forceNewObject: forceNewObject,
      );
}
