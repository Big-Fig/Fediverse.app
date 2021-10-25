import 'type/mastodon_api_web_sockets_channel_type_sealed.dart';

abstract class IMastodonApiWebSocketsChannel {
  String get type;

  bool? get localOnly;

  bool? get mediaOnly;

  String? get fromAccountIdOnly;

  bool? get notificationOnly;

  String? get listIdOnly;

  String? get tag;
}

extension IMastodonApiWebSocketsChannelTypeExtension
    on IMastodonApiWebSocketsChannel {
  MastodonApiWebSocketsChannelType get typeAsMastodonApi =>
      type.toMastodonApiWebSocketsChannelType();
}
