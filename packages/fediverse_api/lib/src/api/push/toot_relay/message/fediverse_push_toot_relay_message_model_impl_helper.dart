import 'fediverse_push_toot_relay_message_model_impl.dart';

abstract class FediversePushTootRelayMessageMockHelper {
  // ignore: long-method
  static FediversePushTootRelayMessage generate({
    required String seed,
  }) =>
      FediversePushTootRelayMessage(
        cryptoKey: seed + 'cryptoKey',
        salt: seed + 'salt',
        payload: seed + 'payload',
        account: seed + 'account',
        server: seed + 'server',
      );
}
