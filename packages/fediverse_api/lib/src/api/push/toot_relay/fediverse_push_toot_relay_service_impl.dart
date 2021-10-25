import 'package:easy_dispose/easy_dispose.dart';

import '../../../../fediverse_api_utils.dart';
import 'fediverse_push_toot_relay_service.dart';

class FediversePushTootRelayService extends DisposableOwner
    implements IFediversePushTootRelayService {
  final String tootRelayServerUrl;

  FediversePushTootRelayService({
    required this.tootRelayServerUrl,
  });

  @override
  String calculateWebPushCallbackUrl({
    required String instanceUrl,
    required String account,
    required String deviceToken,
  }) {
    var host = Uri.parse(instanceUrl).host;

    var endpoint = UrlPathHelper.join(
      [
        host,
        '$deviceToken?account=$account&server=$host',
      ],
    );

    return endpoint;

//     if (Platform.isIOS) {
//       endpoint += '&device=iOS';
//       // ignore: no-empty-block
//     } else if (Platform.isAndroid) {
// //      endpoint += '&device=android';
//       // nothing
//     } else {
//       throw 'Unsupported platform ${Platform.operatingSystem}';
//     }
//     _logger.finest('createPushRelayEndPointUrl endpoint=$endpoint');
  }
}
