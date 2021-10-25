import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'fediverse_api_access_level_model.dart';

part 'fediverse_api_access_level_model_impl.freezed.dart';
part 'fediverse_api_access_level_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class FediverseApiAccessLevel
    with _$FediverseApiAccessLevel
    implements IFediverseApiAccessLevel {
  const factory FediverseApiAccessLevel({
    @JsonKey(name: 'stringValue') @HiveField(1) required String stringValue,
  }) = _FediverseApiAccessLevel;

  factory FediverseApiAccessLevel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiAccessLevelFromJson(json);
}
