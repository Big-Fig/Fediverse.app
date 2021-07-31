import 'package:easy_dispose/easy_dispose.dart';
import '../channel/web_sockets_channel.dart';
import '../channel/web_sockets_channel_impl.dart';
import '../channel/web_sockets_channel_model.dart';
import '../service/config/web_sockets_service_config_bloc.dart';
import '../service/web_sockets_service.dart';
import '../web_sockets_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger('web_sockets_service_impl.dart');

class WebSocketsService extends DisposableOwner implements IWebSocketsService {
  final IWebSocketsServiceConfigBloc configBloc;

  final Map<Uri, IWebSocketsChannel> urlToChannel = {};

  WebSocketsService({
    required this.configBloc,
  }) {
    addDisposable(
      CustomDisposable(
        () async {
          urlToChannel.values.forEach((channel) => channel.dispose());
          urlToChannel.clear();
        },
      ),
    );
  }

  @override
  IWebSocketsChannel<T>
      getOrCreateWebSocketsChannel<T extends WebSocketsEvent>({
    required IWebSocketsChannelConfig<T> config,
  }) {
    var url = config.calculateWebSocketsUrl();
    if (!urlToChannel.containsKey(url)) {
      urlToChannel[url] = createChannel<T>(config);
    }

    // todo: think about cast
    return urlToChannel[url]! as IWebSocketsChannel<T>;
  }

  IWebSocketsChannel createChannel<T extends WebSocketsEvent>(
    IWebSocketsChannelConfig<T> config,
  ) {
    _logger.finest(() => 'createChannel $config');

    return WebSocketsChannel<T>(
      config: config,
      serviceConfigBloc: configBloc,
    );
  }
}
