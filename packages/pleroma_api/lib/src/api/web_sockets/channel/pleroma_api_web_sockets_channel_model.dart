import 'package:mastodon_api/mastodon_api.dart';

import 'type/pleroma_api_web_sockets_channel_type_sealed.dart';

abstract class IPleromaApiWebSocketsChannel
    implements IMastodonApiWebSocketsChannel {
  bool? get remoteOnly;
  bool? get chatOnly;

  String? get onlyFromInstance;
}

extension IPleromaApiWebSocketsChannelTypeExtension
    on IPleromaApiWebSocketsChannel {
  PleromaApiWebSocketsChannelType get typeAsPleromaApi =>
      type.toPleromaApiWebSocketsChannelType();
}
