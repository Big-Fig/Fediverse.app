import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../api/fediverse_api_model.dart';

part 'websockets_channel_handler_type_model.freezed.dart';

@freezed
class WebSocketsChannelHandlerType
    with _$WebSocketsChannelHandlerType
    implements IFediverseApiUnion {
  static const backgroundStringValue = 'background';
  static const foregroundStringValue = 'foreground';

  static const backgroundValue = WebSocketsChannelHandlerType.background();
  static const foregroundValue = WebSocketsChannelHandlerType.foreground();

  static const values = [
    backgroundValue,
    foregroundValue,
  ];

  const factory WebSocketsChannelHandlerType.background({
    @Default(WebSocketsChannelHandlerType.backgroundStringValue)
        String stringValue,
  }) = _Background;

  const factory WebSocketsChannelHandlerType.foreground({
    @Default(WebSocketsChannelHandlerType.foregroundStringValue)
        String stringValue,
  }) = _Foreground;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static WebSocketsChannelHandlerType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}
