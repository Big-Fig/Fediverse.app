import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/push/subscription/alerts/unifedi_api_push_subscription_alerts_model.dart';

part 'unifedi_api_push_subscription_alerts_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_push_subscription_alerts_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionAlertsPleromaAdapter
    with _$UnifediApiPushSubscriptionAlertsPleromaAdapter
    implements IUnifediApiPushSubscriptionAlerts {
  const UnifediApiPushSubscriptionAlertsPleromaAdapter._();
  const factory UnifediApiPushSubscriptionAlertsPleromaAdapter(
    @HiveField(0) PleromaApiPushSubscriptionAlerts value,
  ) = _UnifediApiPushSubscriptionAlertsPleromaAdapter;

  @override
  bool? get chatMention => value.pleromaChatMention;

  @override
  bool? get emojiReaction => value.pleromaEmojiReaction;

  @override
  bool? get favourite => value.favourite;

  @override
  bool? get follow => value.follow;

  @override
  bool? get mention => value.mention;

  @override
  bool? get poll => value.poll;

  @override
  bool? get reblog => value.reblog;
  factory UnifediApiPushSubscriptionAlertsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionAlertsPleromaAdapterFromJson(json);
}

extension UnifediApiPushSubscriptionAlertsPleromaExtension
    on IUnifediApiPushSubscriptionAlerts {
  PleromaApiPushSubscriptionAlerts toPleromaApiPushSubscriptionAlerts() =>
      PleromaApiPushSubscriptionAlerts(
        favourite: favourite,
        follow: follow,
        mention: mention,
        reblog: reblog,
        poll: poll,
        pleromaChatMention: chatMention,
        pleromaEmojiReaction: emojiReaction,
      );
}

extension PleromaApiPushSubscriptionAlertsUnifediExtension
    on IPleromaApiPushSubscriptionAlerts {
  UnifediApiPushSubscriptionAlertsPleromaAdapter
      toUnifediApiPushSubscriptionAlertsPleromaAdapter() =>
          UnifediApiPushSubscriptionAlertsPleromaAdapter(
            toPleromaApiPushSubscriptionAlerts(),
          );
}

extension PleromaApiPushSubscriptionAlertsUnifediListExtension
    on List<IPleromaApiPushSubscriptionAlerts> {
  List<UnifediApiPushSubscriptionAlertsPleromaAdapter>
      toUnifediApiPushSubscriptionAlertsPleromaAdapterList() => map(
            (item) => item.toUnifediApiPushSubscriptionAlertsPleromaAdapter(),
          ).toList();
}
