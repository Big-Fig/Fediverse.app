import '../../../unifedi_api_model.dart';

abstract class IUnifediApiPushSubscriptionKeys implements IUnifediApiObject {
  /// User agent public key.
  /// Base64 encoded string of public key of ECDH key using prime256v1 curve.
  String get p256dh;

  /// Auth secret. Base64 encoded string of 16 bytes of random data.
  String get auth;
}
