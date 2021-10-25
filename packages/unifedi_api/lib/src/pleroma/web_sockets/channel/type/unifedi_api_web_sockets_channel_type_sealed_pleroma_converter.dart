import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/web_sockets/channel/type/unifedi_api_web_sockets_channel_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiWebSocketsChannelTypePleromaConverter();

class UnifediApiWebSocketsChannelTypePleromaConverter
    implements
        SealedConverter<UnifediApiWebSocketsChannelType,
            PleromaApiWebSocketsChannelType> {
  const UnifediApiWebSocketsChannelTypePleromaConverter();

  @override
  UnifediApiWebSocketsChannelType convertFrom(
    PleromaApiWebSocketsChannelType item,
  ) =>
      item.map(
        public: (_) => UnifediApiWebSocketsChannelType.publicValue,
        direct: (_) => UnifediApiWebSocketsChannelType.directValue,
        user: (_) => UnifediApiWebSocketsChannelType.userValue,
        list: (_) => UnifediApiWebSocketsChannelType.listValue,
        hashtag: (_) => UnifediApiWebSocketsChannelType.hashtagValue,
      );

  @override
  PleromaApiWebSocketsChannelType convertTo(
    UnifediApiWebSocketsChannelType item,
  ) =>
      item.map(
        public: (_) => PleromaApiWebSocketsChannelType.publicValue,
        direct: (_) => PleromaApiWebSocketsChannelType.directValue,
        user: (_) => PleromaApiWebSocketsChannelType.userValue,
        list: (_) => PleromaApiWebSocketsChannelType.listValue,
        hashtag: (_) => PleromaApiWebSocketsChannelType.hashtagValue,
      );
}

extension PleromaApiWebSocketsChannelTypeUnifediExtension
    on PleromaApiWebSocketsChannelType {
  UnifediApiWebSocketsChannelType toUnifediApiWebSocketsChannelType() =>
      _converter.convertFrom(this);
}

extension UnifediApiWebSocketsChannelTypePleromaExtension
    on UnifediApiWebSocketsChannelType {
  PleromaApiWebSocketsChannelType toPleromaApiWebSocketsChannelType() =>
      _converter.convertTo(this);
}
