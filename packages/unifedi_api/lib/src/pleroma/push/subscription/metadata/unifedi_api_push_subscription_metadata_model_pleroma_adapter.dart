import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/push/subscription/keys/unifedi_api_push_subscription_keys_model.dart';
import '../../../../api/push/subscription/metadata/unifedi_api_push_subscription_metadata_model.dart';
import '../keys/unifedi_api_push_subscription_keys_model_pleroma_adapter.dart';

part 'unifedi_api_push_subscription_metadata_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_push_subscription_metadata_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionMetadataPleromaAdapter
    with _$UnifediApiPushSubscriptionMetadataPleromaAdapter
    implements IUnifediApiPushSubscriptionMetadata {
  const UnifediApiPushSubscriptionMetadataPleromaAdapter._();
  const factory UnifediApiPushSubscriptionMetadataPleromaAdapter(
    @HiveField(0) PleromaApiPushSubscriptionMetadata value,
  ) = _UnifediApiPushSubscriptionMetadataPleromaAdapter;

  @override
  String? get endpoint => value.endpoint;

  @override
  IUnifediApiPushSubscriptionKeys? get keys =>
      value.keys.toUnifediApiPushSubscriptionKeysPleromaAdapter();
  factory UnifediApiPushSubscriptionMetadataPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionMetadataPleromaAdapterFromJson(json);
}

extension UnifediApiPushSubscriptionMetadataPleromaExtension
    on IUnifediApiPushSubscriptionMetadata {
  PleromaApiPushSubscriptionMetadata toPleromaApiPushSubscriptionMetadata() =>
      PleromaApiPushSubscriptionMetadata(
        // ignore: avoid-non-null-assertion
        endpoint: endpoint!,
        // ignore: avoid-non-null-assertion
        keys: keys!.toPleromaApiPushSubscriptionKeys(),
      );
}

extension PleromaApiPushSubscriptionMetadataUnifediExtension
    on IPleromaApiPushSubscriptionMetadata {
  UnifediApiPushSubscriptionMetadataPleromaAdapter
      toUnifediApiPushSubscriptionMetadataPleromaAdapter() =>
          UnifediApiPushSubscriptionMetadataPleromaAdapter(
            toPleromaApiPushSubscriptionMetadata(),
          );
}

extension PleromaApiPushSubscriptionMetadataUnifediListExtension
    on List<IPleromaApiPushSubscriptionMetadata> {
  List<UnifediApiPushSubscriptionMetadataPleromaAdapter>
      toUnifediApiPushSubscriptionMetadataPleromaAdapterList() => map(
            (item) => item.toUnifediApiPushSubscriptionMetadataPleromaAdapter(),
          ).toList();
}
