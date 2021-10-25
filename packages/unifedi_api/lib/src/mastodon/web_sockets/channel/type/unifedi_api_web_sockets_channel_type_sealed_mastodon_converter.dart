import 'package:mastodon_api/mastodon_api.dart';
import '../../../../api/web_sockets/channel/type/unifedi_api_web_sockets_channel_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiWebSocketsChannelTypeMastodonConverter();

class UnifediApiWebSocketsChannelTypeMastodonConverter
    implements
        SealedConverter<UnifediApiWebSocketsChannelType,
            MastodonApiWebSocketsChannelType> {
  const UnifediApiWebSocketsChannelTypeMastodonConverter();

  @override
  UnifediApiWebSocketsChannelType convertFrom(
    MastodonApiWebSocketsChannelType item,
  ) =>
      item.map(
        public: (_) => UnifediApiWebSocketsChannelType.publicValue,
        direct: (_) => UnifediApiWebSocketsChannelType.directValue,
        user: (_) => UnifediApiWebSocketsChannelType.userValue,
        list: (_) => UnifediApiWebSocketsChannelType.listValue,
        hashtag: (_) => UnifediApiWebSocketsChannelType.hashtagValue,
      );

  @override
  MastodonApiWebSocketsChannelType convertTo(
    UnifediApiWebSocketsChannelType item,
  ) =>
      item.map(
        public: (_) => MastodonApiWebSocketsChannelType.publicValue,
        direct: (_) => MastodonApiWebSocketsChannelType.directValue,
        user: (_) => MastodonApiWebSocketsChannelType.userValue,
        list: (_) => MastodonApiWebSocketsChannelType.listValue,
        hashtag: (_) => MastodonApiWebSocketsChannelType.hashtagValue,
      );
}

extension MastodonApiWebSocketsChannelTypeUnifediExtension
    on MastodonApiWebSocketsChannelType {
  UnifediApiWebSocketsChannelType toUnifediApiWebSocketsChannelType() =>
      _converter.convertFrom(this);
}

extension UnifediApiWebSocketsChannelTypeMastodonExtension
    on UnifediApiWebSocketsChannelType {
  MastodonApiWebSocketsChannelType toMastodonApiWebSocketsChannelType() =>
      _converter.convertTo(this);
}
