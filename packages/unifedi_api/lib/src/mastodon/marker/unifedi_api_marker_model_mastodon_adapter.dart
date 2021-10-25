import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/marker/unifedi_api_marker_model.dart';

part 'unifedi_api_marker_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_marker_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMarkerMastodonAdapter
    with _$UnifediApiMarkerMastodonAdapter
    implements IUnifediApiMarker {
  const UnifediApiMarkerMastodonAdapter._();
  const factory UnifediApiMarkerMastodonAdapter(
    @HiveField(0) MastodonApiMarker value,
  ) = _UnifediApiMarkerMastodonAdapter;

  @override
  String? get lastReadId => value.lastReadId;

  @override
  int? get unreadCount => null;

  @override
  DateTime? get updatedAt => value.updatedAt;

  @override
  int get version => value.version;
  factory UnifediApiMarkerMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMarkerMastodonAdapterFromJson(json);
}

extension MastodonApiMarkerUnifediExtension on IMastodonApiMarker {
  UnifediApiMarkerMastodonAdapter toUnifediApiMarkerMastodonAdapter() =>
      UnifediApiMarkerMastodonAdapter(
        toMastodonApiMarker(),
      );
}

extension MastodonApiMarkerUnifediListExtension on List<IMastodonApiMarker> {
  List<UnifediApiMarkerMastodonAdapter>
      toUnifediApiMarkerMastodonAdapterList() => map(
            (item) => item.toUnifediApiMarkerMastodonAdapter(),
          ).toList();
}
