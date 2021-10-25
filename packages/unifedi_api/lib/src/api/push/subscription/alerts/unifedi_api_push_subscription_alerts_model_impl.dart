import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_push_subscription_alerts_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_push_subscription_alerts_model_impl.freezed.dart';

part 'unifedi_api_push_subscription_alerts_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiPushSubscriptionAlerts
    with _$UnifediApiPushSubscriptionAlerts
    implements IUnifediApiPushSubscriptionAlerts {
  const factory UnifediApiPushSubscriptionAlerts({
    @HiveField(0) required bool? favourite,
    @HiveField(1) required bool? follow,
    @HiveField(2) required bool? mention,
    @HiveField(3) required bool? reblog,
    @HiveField(4) required bool? poll,
    @HiveField(5)
    @JsonKey(name: 'unifedi:chat_mention')
        required bool? chatMention,
    @HiveField(6)
    @JsonKey(name: 'unifedi:emoji_reaction')
        required bool? emojiReaction,
  }) = _UnifediApiPushSubscribeRequestDataAlerts;

  factory UnifediApiPushSubscriptionAlerts.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionAlertsFromJson(json);
}

extension IUnifediApiPushSubscriptionAlertsInterfaceExtension
    on IUnifediApiPushSubscriptionAlerts {
  UnifediApiPushSubscriptionAlerts toUnifediApiPushSubscriptionAlerts({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPushSubscriptionAlerts(
          favourite: favourite,
          follow: follow,
          mention: mention,
          reblog: reblog,
          poll: poll,
          chatMention: chatMention,
          emojiReaction: emojiReaction,
        ),
        forceNewObject: forceNewObject,
      );
}
