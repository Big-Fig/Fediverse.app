import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/access/level/unifedi_api_access_level_model.dart';

part 'unifedi_api_access_level_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_level_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessLevelPleromaAdapter
    with _$UnifediApiAccessLevelPleromaAdapter
    implements IUnifediApiAccessLevel {
  const UnifediApiAccessLevelPleromaAdapter._();
  const factory UnifediApiAccessLevelPleromaAdapter(
    @HiveField(0) PleromaApiAccessLevel value,
  ) = _UnifediApiAccessLevelPleromaAdapter;

  @override
  String get stringValue => value.stringValue;
  factory UnifediApiAccessLevelPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessLevelPleromaAdapterFromJson(json);
}

extension PleromaApiAccessLevelUnifediExtension on IPleromaApiAccessLevel {
  UnifediApiAccessLevelPleromaAdapter toUnifediApiAccessLevelPleromaAdapter() =>
      UnifediApiAccessLevelPleromaAdapter(
        toPleromaApiAccessLevel(),
      );
}
