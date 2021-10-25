import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'pleroma_api_access_level_model.dart';
import 'type/pleroma_api_access_level_type_sealed.dart';

part 'pleroma_api_access_level_model_impl.freezed.dart';

part 'pleroma_api_access_level_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessLevel
    with _$PleromaApiAccessLevel
    implements IPleromaApiAccessLevel {
  static const public = PleromaApiAccessLevel(
    stringValue: PleromaApiAccessLevelType.publicLevelStringValue,
  );
  static const user = PleromaApiAccessLevel(
    stringValue: PleromaApiAccessLevelType.userLevelStringValue,
  );
  static const application = PleromaApiAccessLevel(
    stringValue: PleromaApiAccessLevelType.applicationLevelStringValue,
  );

  const factory PleromaApiAccessLevel({
    @JsonKey(name: 'string_value') @HiveField(1) required String stringValue,
  }) = _PleromaApiAccessLevel;

  factory PleromaApiAccessLevel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessLevelFromJson(json);
}

extension IPleromaApiAccessLevelInterfaceExtension on IPleromaApiAccessLevel {
  PleromaApiAccessLevel toPleromaApiAccessLevel({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessLevel(
          stringValue: stringValue,
        ),
        forceNewObject: forceNewObject,
      );
}
