import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_exception.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

var _logger = Logger("pleroma_my_account_service_impl.dart");

class PleromaMyAccountService implements IPleromaMyAccountService {
  final verifyProfileRelativeUrlPath = "/api/v1/accounts/verify_credentials";
  final editProfileRelativeUrlPath = "/api/v1/accounts/update_credentials";
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

  PleromaMyAccountService({@required this.restService});

  IPleromaAccount parseMyAccountResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaMyAccount.fromJsonString(httpResponse.body);
    } else {
      throw new PleromaMyAccountException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<IPleromaMyAccount> updateCredentials(IPleromaMyAccountEdit data) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.patch(
      relativePath: editProfileRelativeUrlPath,
      bodyJson: data.toJson(),
    ));

    return parseMyAccountResponse(httpResponse);
  }

  @override
  Future<IPleromaMyAccount> updateFiles(
      PleromaMyAccountFilesRequest accountFiles) async {
    _logger.finest(() => "updateFiles $accountFiles");
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.patch(
            relativePath: editProfileRelativeUrlPath,
            files: {
          "header": accountFiles.header,
          "avatar": accountFiles.avatar,
        }));

    return parseMyAccountResponse(httpResponse);
  }

  @override
  Future<IPleromaMyAccount> verifyCredentials() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(relativePath: verifyProfileRelativeUrlPath),
    );

    return parseMyAccountResponse(httpResponse);
  }

  @override
  void dispose() {
    // nothing
  }
}
