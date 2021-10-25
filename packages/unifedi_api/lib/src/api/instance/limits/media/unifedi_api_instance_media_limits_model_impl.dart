import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_media_limits_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_media_limits_model_impl.freezed.dart';

part 'unifedi_api_instance_media_limits_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceMediaLimits
    with _$UnifediApiInstanceMediaLimits
    implements IUnifediApiInstanceMediaLimits {
  const factory UnifediApiInstanceMediaLimits({
    @HiveField(0) @JsonKey(name: 'upload_limit') required int? uploadLimit,
    @HiveField(1)
    @JsonKey(name: 'avatar_upload_limit')
        required int? avatarUploadLimit,
    @HiveField(2)
    @JsonKey(name: 'background_upload_limit')
        required int? backgroundUploadLimit,
    @HiveField(3)
    @JsonKey(name: 'banner_upload_limit')
        required int? bannerUploadLimit,
    @HiveField(4)
    @JsonKey(name: 'description_limit')
        required int? descriptionLimit,
  }) = _UnifediApiInstanceMediaLimits;

  factory UnifediApiInstanceMediaLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceMediaLimitsFromJson(json);
}

extension UnifediApiInstanceMediaLimitsInterfaceExtension
    on IUnifediApiInstanceMediaLimits {
  UnifediApiInstanceMediaLimits toUnifediApiInstanceMediaLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceMediaLimits(
          uploadLimit: uploadLimit,
          avatarUploadLimit: avatarUploadLimit,
          backgroundUploadLimit: backgroundUploadLimit,
          bannerUploadLimit: bannerUploadLimit,
          descriptionLimit: descriptionLimit,
        ),
        forceNewObject: forceNewObject,
      );
}
