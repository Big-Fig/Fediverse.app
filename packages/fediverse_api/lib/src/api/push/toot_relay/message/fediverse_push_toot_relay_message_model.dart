abstract class IFediversePushTootRelayMessage {
  String get cryptoKey;

  String get salt;

  String get payload;

  String get account;

  String get server;
}
