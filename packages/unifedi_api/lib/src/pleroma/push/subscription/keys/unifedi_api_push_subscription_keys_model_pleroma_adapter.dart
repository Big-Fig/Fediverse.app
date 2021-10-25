import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/push/subscription/keys/unifedi_api_push_subscription_keys_model.dart';

part 'unifedi_api_push_subscription_keys_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_push_subscription_keys_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionKeysPleromaAdapter
    with _$UnifediApiPushSubscriptionKeysPleromaAdapter
    implements IUnifediApiPushSubscriptionKeys {
  const UnifediApiPushSubscriptionKeysPleromaAdapter._();
  const factory UnifediApiPushSubscriptionKeysPleromaAdapter(
    @HiveField(0) PleromaApiPushSubscriptionKeys value,
  ) = _UnifediApiPushSubscriptionKeysPleromaAdapter;

  @override
  String get auth => value.auth;

  @override
  String get p256dh => value.p256dh;
  factory UnifediApiPushSubscriptionKeysPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionKeysPleromaAdapterFromJson(json);
}

extension PleromaApiPushSubscriptionKeysUnifediExtension
    on IPleromaApiPushSubscriptionKeys {
  UnifediApiPushSubscriptionKeysPleromaAdapter
      toUnifediApiPushSubscriptionKeysPleromaAdapter() =>
          UnifediApiPushSubscriptionKeysPleromaAdapter(
            toPleromaApiPushSubscriptionKeys(),
          );
}

extension UnifediApiPushSubscriptionKeysPleromaExtension
    on IUnifediApiPushSubscriptionKeys {
  PleromaApiPushSubscriptionKeys toPleromaApiPushSubscriptionKeys() =>
      PleromaApiPushSubscriptionKeys(
        p256dh: p256dh,
        auth: auth,
      );
}

extension PleromaApiPushSubscriptionKeysUnifediListExtension
    on List<IPleromaApiPushSubscriptionKeys> {
  List<UnifediApiPushSubscriptionKeysPleromaAdapter>
      toUnifediApiPushSubscriptionKeysPleromaAdapterList() => map(
            (item) => item.toUnifediApiPushSubscriptionKeysPleromaAdapter(),
          ).toList();
}
