import '../../../../enum/enum_mock_helper.dart';
import 'websockets_channel_handler_type_model.dart';

class FediverseApiInstanceTypeMockHelper {
  static WebSocketsChannelHandlerType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: WebSocketsChannelHandlerType.values,
      );
}
