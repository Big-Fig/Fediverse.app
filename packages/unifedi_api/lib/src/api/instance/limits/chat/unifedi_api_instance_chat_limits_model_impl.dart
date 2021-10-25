import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_chat_limits_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_chat_limits_model_impl.freezed.dart';

part 'unifedi_api_instance_chat_limits_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceChatLimits
    with _$UnifediApiInstanceChatLimits
    implements IUnifediApiInstanceChatLimits {
  const factory UnifediApiInstanceChatLimits({
    @HiveField(0) @JsonKey(name: 'message_limit') required int? messageLimit,
  }) = _UnifediApiInstanceChatLimits;

  factory UnifediApiInstanceChatLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceChatLimitsFromJson(json);
}

extension UnifediApiInstanceChatLimitsInterfaceExtension
    on IUnifediApiInstanceChatLimits {
  UnifediApiInstanceChatLimits toUnifediApiInstanceChatLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceChatLimits(
          messageLimit: messageLimit,
        ),
        forceNewObject: forceNewObject,
      );
}
