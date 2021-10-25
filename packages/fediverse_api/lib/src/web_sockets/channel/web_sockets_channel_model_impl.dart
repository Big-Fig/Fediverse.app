import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../fediverse_api_utils.dart';
import '../../url/query/arg/url_query_arg_model.dart';
import 'web_sockets_channel_model.dart';

part 'web_sockets_channel_model_impl.freezed.dart';

part 'web_sockets_channel_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class WebSocketsChannelConfig
    with _$WebSocketsChannelConfig
    implements IWebSocketsChannelConfig {
  const factory WebSocketsChannelConfig({
    @HiveField(0) required String url,
  }) = _WebSocketsChannelConfig;

  static WebSocketsChannelConfig compose({
    required String baseUrl,
    required List<UrlQueryArg> queryArgs,
  }) {
    var url = baseUrl + '?' + queryArgs.toQueryPart();

    return WebSocketsChannelConfig(
      url: url,
    );
  }

  factory WebSocketsChannelConfig.fromJson(Map<String, dynamic> json) =>
      _$WebSocketsChannelConfigFromJson(json);
}
