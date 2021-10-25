import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/version/range/unifedi_api_version_range_model.dart';
import '../../../api/version/unifedi_api_version_model.dart';
import '../unifedi_api_version_model_pleroma_adapter.dart';

part 'unifedi_api_version_range_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_version_range_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiVersionRangePleromaAdapter
    with _$UnifediApiVersionRangePleromaAdapter
    implements IUnifediApiVersionRange {
  const UnifediApiVersionRangePleromaAdapter._();
  const factory UnifediApiVersionRangePleromaAdapter(
    @HiveField(0) PleromaApiVersionRange value,
  ) = _UnifediApiVersionRangePleromaAdapter;

  @override
  IUnifediApiVersion? get max => value.max?.toUnifediApiVersionPleromaAdapter();

  @override
  bool get maxInclusive => value.maxInclusive;

  @override
  IUnifediApiVersion? get min => value.min?.toUnifediApiVersionPleromaAdapter();

  @override
  bool get minInclusive => value.minInclusive;
  factory UnifediApiVersionRangePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiVersionRangePleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension on IPleromaApiVersionRange {
  UnifediApiVersionRangePleromaAdapter
      toUnifediApiVersionRangePleromaAdapter() =>
          UnifediApiVersionRangePleromaAdapter(
            toPleromaApiVersionRange(),
          );
}
