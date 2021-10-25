import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_marker_model.dart';

part 'mastodon_api_marker_model_impl.freezed.dart';

part 'mastodon_api_marker_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiMarker with _$MastodonApiMarker implements IMastodonApiMarker {
  const factory MastodonApiMarker({
    @HiveField(0)
    @JsonKey(name: 'updated_last_read_id')
        required String? lastReadId,
    @HiveField(1) required int version,
    @HiveField(2) @JsonKey(name: 'updated_at') required DateTime? updatedAt,
  }) = _MastodonApiMarker;

  factory MastodonApiMarker.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiMarkerFromJson(json);
}

extension MastodonApiMarkerInterfaceExtension on IMastodonApiMarker {
  MastodonApiMarker toMastodonApiMarker({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMarker(
          lastReadId: lastReadId,
          version: version,
          updatedAt: updatedAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiMarkerInterfaceListExtension on List<IMastodonApiMarker> {
  List<MastodonApiMarker> toMastodonApiMarkerList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiMarker item) => item.toMastodonApiMarker(),
        forceNewObject: forceNewObject,
      );
}
