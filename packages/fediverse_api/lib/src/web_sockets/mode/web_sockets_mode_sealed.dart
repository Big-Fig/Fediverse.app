import 'package:freezed_annotation/freezed_annotation.dart';

import '../../api/fediverse_api_model.dart';

part 'web_sockets_mode_sealed.freezed.dart';

@freezed
class WebSocketsMode with _$WebSocketsMode implements IFediverseApiUnion {
  static const disabledStringValue = 'disabled';
  static const onlyForegroundStringValue = 'onlyForeground';
  static const foregroundAndBackgroundStringValue = 'foregroundAndBackground';

  static const disabledValue = WebSocketsMode.disabled();
  static const onlyForegroundValue = WebSocketsMode.onlyForeground();
  static const foregroundAndBackgroundValue =
      WebSocketsMode.foregroundAndBackground();

  static const values = [
    disabledValue,
    onlyForegroundValue,
    foregroundAndBackgroundValue,
  ];

  const factory WebSocketsMode.disabled({
    @Default(WebSocketsMode.disabledStringValue) String stringValue,
  }) = _Disabled;

  const factory WebSocketsMode.onlyForeground({
    @Default(WebSocketsMode.onlyForegroundStringValue) String stringValue,
  }) = _OnlyForeground;

  const factory WebSocketsMode.foregroundAndBackground({
    @Default(WebSocketsMode.foregroundAndBackgroundStringValue)
        String stringValue,
  }) = _ForegroundAndBackground;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static WebSocketsMode fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}
