import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../interface_to_impl/interface_to_impl_helper.dart';
import '../fediverse_api_version_model_impl.dart';
import 'fediverse_api_version_range_model.dart';
// ignore_for_file: no-magic-number
part 'fediverse_api_version_range_model_impl.freezed.dart';

part 'fediverse_api_version_range_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class FediverseApiVersionRange
    with _$FediverseApiVersionRange
    implements IFediverseApiVersionRange {
  const factory FediverseApiVersionRange({
    @HiveField(0) required FediverseApiVersion? min,
    @HiveField(1) required FediverseApiVersion? max,
    @HiveField(2)
    @JsonKey(name: 'min_inclusive')
    @Default(true)
        bool minInclusive,
    @HiveField(3)
    @JsonKey(name: 'max_inclusive')
    @Default(false)
        bool maxInclusive,
  }) = _FediverseApiVersionRange;

  factory FediverseApiVersionRange.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiVersionRangeFromJson(json);
}

extension IFediverseApiVersionRangeInterfaceExtension
    on IFediverseApiVersionRange {
  FediverseApiVersionRange toFediverseApiVersionRange({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => FediverseApiVersionRange(
          min: min?.toFediverseApiVersion(forceNewObject: forceNewObject),
          max: max?.toFediverseApiVersion(forceNewObject: forceNewObject),
          minInclusive: minInclusive,
          maxInclusive: maxInclusive,
        ),
        forceNewObject: forceNewObject,
      );
}
