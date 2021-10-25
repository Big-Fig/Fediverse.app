import 'package:easy_dispose/easy_dispose.dart';

abstract class IFediversePushTootRelayService implements IDisposable {
  String calculateWebPushCallbackUrl({
    required String instanceUrl,
    required String account,
    required String deviceToken,
  });
}
