import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/marker/unifedi_api_marker_model.dart';

part 'unifedi_api_marker_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_marker_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMarkerPleromaAdapter
    with _$UnifediApiMarkerPleromaAdapter
    implements IUnifediApiMarker {
  const UnifediApiMarkerPleromaAdapter._();
  const factory UnifediApiMarkerPleromaAdapter(
    @HiveField(0) PleromaApiMarker value,
  ) = _UnifediApiMarkerPleromaAdapter;

  @override
  String? get lastReadId => value.lastReadId;

  @override
  int? get unreadCount => value.pleroma?.unreadCount;

  @override
  DateTime? get updatedAt => value.updatedAt;

  @override
  int get version => value.version;
  factory UnifediApiMarkerPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMarkerPleromaAdapterFromJson(json);
}

extension PleromaApiMarkerUnifediExtension on IPleromaApiMarker {
  UnifediApiMarkerPleromaAdapter toUnifediApiMarkerPleromaAdapter() =>
      UnifediApiMarkerPleromaAdapter(
        toPleromaApiMarker(),
      );
}

extension PleromaApiMarkerUnifediListExtension on List<IPleromaApiMarker> {
  List<UnifediApiMarkerPleromaAdapter> toUnifediApiMarkerPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiMarkerPleromaAdapter(),
      ).toList();
}
