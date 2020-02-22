import 'package:fedi/Pleroma/account/pleroma_account_exception.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/account/pleroma_account_service.dart';
import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/Pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaAccountService implements IPleromaAccountService {
  final accountRelativeUrlPath = "/api/v1/accounts/";
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyoUse => restService.isApiReadyoUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaAccountService({@required this.restService});

  List<IPleromaAccount> parseAccountListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccount.listFromJsonString(httpResponse.body);
    } else {
      throw new PleromaAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaAccount>> getAccountFollowings(
      {@required String accountRemoteId,
      String sinceId,
      String maxId,
      int limit = 20}) async {
    assert(accountRemoteId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.patch(
        relativePath:
            urlPath.join(accountRelativeUrlPath, accountRemoteId, "following"),
        bodyJson: {
          "since_id": sinceId,
          "max_id": maxId,
          "limit": limit.toString(),
        }));

    return parseAccountListResponse(httpResponse);
  }
}
