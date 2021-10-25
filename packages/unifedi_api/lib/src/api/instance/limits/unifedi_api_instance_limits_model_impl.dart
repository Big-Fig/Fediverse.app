import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'chat/unifedi_api_instance_chat_limits_model_impl.dart';
import 'field/unifedi_api_instance_field_limits_model_impl.dart';
import 'media/unifedi_api_instance_media_limits_model_impl.dart';
import 'poll/unifedi_api_instance_poll_limits_model_impl.dart';
import 'status/unifedi_api_instance_status_limits_model_impl.dart';
import 'unifedi_api_instance_limits_model.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_instance_limits_model_impl.freezed.dart';

part 'unifedi_api_instance_limits_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceLimits
    with _$UnifediApiInstanceLimits
    implements IUnifediApiInstanceLimits {
  const factory UnifediApiInstanceLimits({
    @HiveField(0) required UnifediApiInstancePollLimits? poll,
    @HiveField(1) required UnifediApiInstanceFieldLimits? field,
    @HiveField(2) required UnifediApiInstanceMediaLimits? media,
    @HiveField(3) required UnifediApiInstanceChatLimits? chat,
    @HiveField(4) required UnifediApiInstanceStatusLimits? status,
  }) = _UnifediApiInstanceLimits;

  factory UnifediApiInstanceLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceLimitsFromJson(
        json,
      );
}

extension UnifediApiInstanceLimitsInterfaceExtension
    on IUnifediApiInstanceLimits {
  UnifediApiInstanceLimits toUnifediApiInstanceLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceLimits(
          poll: poll?.toUnifediApiInstancePollLimits(),
          field: field?.toUnifediApiInstanceFieldLimits(),
          media: media?.toUnifediApiInstanceMediaLimits(),
          chat: chat?.toUnifediApiInstanceChatLimits(),
          status: status?.toUnifediApiInstanceStatusLimits(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiInstanceLimitsInterfaceListExtension
    on List<IUnifediApiInstanceLimits> {
  List<UnifediApiInstanceLimits> toUnifediApiInstanceLimitsList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiInstanceLimits item) => item.toUnifediApiInstanceLimits(),
        forceNewObject: forceNewObject,
      );
}
