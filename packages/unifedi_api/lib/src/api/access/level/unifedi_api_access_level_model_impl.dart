import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'type/unifedi_api_access_level_type_sealed.dart';
import 'unifedi_api_access_level_model.dart';

part 'unifedi_api_access_level_model_impl.freezed.dart';

part 'unifedi_api_access_level_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessLevel
    with _$UnifediApiAccessLevel
    implements IUnifediApiAccessLevel {
  static const public = UnifediApiAccessLevel(
    stringValue: UnifediApiAccessLevelType.publicLevelStringValue,
  );
  static const user = UnifediApiAccessLevel(
    stringValue: UnifediApiAccessLevelType.userLevelStringValue,
  );
  static const application = UnifediApiAccessLevel(
    stringValue: UnifediApiAccessLevelType.applicationLevelStringValue,
  );

  const factory UnifediApiAccessLevel({
    @HiveField(1) @JsonKey(name: 'string_value') required String stringValue,
  }) = _UnifediApiAccessLevel;

  factory UnifediApiAccessLevel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessLevelFromJson(json);
}

extension IUnifediApiAccessLevelInterfaceExtension on IUnifediApiAccessLevel {
  UnifediApiAccessLevel toUnifediApiAccessLevel({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccessLevel(
          stringValue: stringValue,
        ),
        forceNewObject: forceNewObject,
      );
}
