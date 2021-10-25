import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/web_sockets/channel/unifedi_api_web_sockets_channel_model.dart';
import 'type/unifedi_api_web_sockets_channel_type_sealed_mastodon_converter.dart';

part 'unifedi_api_web_sockets_channel_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_web_sockets_channel_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiWebSocketsChannelMastodonAdapter
    with _$UnifediApiWebSocketsChannelMastodonAdapter
    implements IUnifediApiWebSocketsChannel {
  const UnifediApiWebSocketsChannelMastodonAdapter._();
  const factory UnifediApiWebSocketsChannelMastodonAdapter(
    @HiveField(0) MastodonApiWebSocketsChannel value,
  ) = _UnifediApiWebSocketsChannelMastodonAdapter;

  @override
  String get type =>
      value.typeAsMastodonApi.toUnifediApiWebSocketsChannelType().stringValue;

  @override
  bool? get localOnly => value.localOnly;

  @override
  bool? get remoteOnly => null;

  @override
  bool? get mediaOnly => value.mediaOnly;

  @override
  String? get onlyFromInstance => null;

  @override
  String? get fromAccountIdOnly => value.fromAccountIdOnly;

  @override
  bool? get chatOnly => null;

  @override
  bool? get notificationOnly => value.notificationOnly;

  @override
  String? get listIdOnly => value.listIdOnly;

  @override
  String? get tag => value.tag;
  factory UnifediApiWebSocketsChannelMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiWebSocketsChannelMastodonAdapterFromJson(json);
}

extension MastodonApiWebSocketsChannelUnifediExtension
    on IMastodonApiWebSocketsChannel {
  UnifediApiWebSocketsChannelMastodonAdapter
      toUnifediApiWebSocketsChannelMastodonAdapter() =>
          UnifediApiWebSocketsChannelMastodonAdapter(
            toMastodonApiWebSocketsChannel(),
          );
}
