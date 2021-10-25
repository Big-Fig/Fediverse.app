import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../mastodon_api_version_model_impl.dart';
import 'mastodon_api_version_range_model.dart';
// ignore_for_file: no-magic-number
part 'mastodon_api_version_range_model_impl.freezed.dart';

part 'mastodon_api_version_range_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiVersionRange
    with _$MastodonApiVersionRange
    implements IMastodonApiVersionRange {
  const factory MastodonApiVersionRange({
    @HiveField(0) required MastodonApiVersion? min,
    @HiveField(1) required MastodonApiVersion? max,
    @HiveField(2)
    @JsonKey(name: 'min_inclusive')
    @Default(true)
        bool minInclusive,
    @HiveField(3)
    @JsonKey(name: 'max_inclusive')
    @Default(false)
        bool maxInclusive,
  }) = _MastodonApiVersionRange;

  factory MastodonApiVersionRange.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiVersionRangeFromJson(json);
}

extension IMastodonApiVersionRangeInterfaceExtension
    on IMastodonApiVersionRange {
  MastodonApiVersionRange toMastodonApiVersionRange({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiVersionRange(
          min: min?.toMastodonApiVersion(forceNewObject: forceNewObject),
          max: max?.toMastodonApiVersion(forceNewObject: forceNewObject),
          minInclusive: minInclusive,
          maxInclusive: maxInclusive,
        ),
        forceNewObject: forceNewObject,
      );
}
