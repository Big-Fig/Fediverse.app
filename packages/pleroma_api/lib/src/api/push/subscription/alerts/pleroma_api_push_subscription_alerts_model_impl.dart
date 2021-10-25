import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_push_subscription_alerts_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_push_subscription_alerts_model_impl.freezed.dart';

part 'pleroma_api_push_subscription_alerts_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiPushSubscriptionAlerts
    with _$PleromaApiPushSubscriptionAlerts
    implements IPleromaApiPushSubscriptionAlerts {
  const factory PleromaApiPushSubscriptionAlerts({
    @HiveField(0) required bool? favourite,
    @HiveField(1) required bool? follow,
    @HiveField(2) required bool? mention,
    @HiveField(3) required bool? reblog,
    @HiveField(4) required bool? poll,
    @HiveField(5)
    @JsonKey(name: 'pleroma:chat_mention')
        required bool? pleromaChatMention,
    @HiveField(6)
    @JsonKey(name: 'pleroma:emoji_reaction')
        required bool? pleromaEmojiReaction,
  }) = _PleromaApiPushSubscribeRequestDataAlerts;

  factory PleromaApiPushSubscriptionAlerts.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiPushSubscriptionAlertsFromJson(json);
}

extension IPleromaApiPushSubscriptionAlertsInterfaceExtension
    on IPleromaApiPushSubscriptionAlerts {
  PleromaApiPushSubscriptionAlerts toPleromaApiPushSubscriptionAlerts({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPushSubscriptionAlerts(
          favourite: favourite,
          follow: follow,
          mention: mention,
          reblog: reblog,
          poll: poll,
          pleromaChatMention: pleromaChatMention,
          pleromaEmojiReaction: pleromaEmojiReaction,
        ),
        forceNewObject: forceNewObject,
      );
}
