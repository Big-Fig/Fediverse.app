import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_status_limits_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_status_limits_model_impl.freezed.dart';

part 'unifedi_api_instance_status_limits_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceStatusLimits
    with _$UnifediApiInstanceStatusLimits
    implements IUnifediApiInstanceStatusLimits {
  const factory UnifediApiInstanceStatusLimits({
    @HiveField(0) @JsonKey(name: 'max_toot_chars') required int? maxTootChars,
    @HiveField(1)
    @JsonKey(name: 'max_media_attachments_count')
        required int? maxMediaAttachmentsCount,
  }) = _UnifediApiInstanceStatusLimits;

  factory UnifediApiInstanceStatusLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceStatusLimitsFromJson(json);
}

extension UnifediApiInstanceStatusLimitsInterfaceExtension
    on IUnifediApiInstanceStatusLimits {
  UnifediApiInstanceStatusLimits toUnifediApiInstanceStatusLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceStatusLimits(
          maxTootChars: maxTootChars,
          maxMediaAttachmentsCount: maxMediaAttachmentsCount,
        ),
        forceNewObject: forceNewObject,
      );
}
