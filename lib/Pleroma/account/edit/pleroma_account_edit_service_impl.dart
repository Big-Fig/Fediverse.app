import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_exception.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_model.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_model.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pleroma_account_edit_service_impl.dart");

class PleromaAccountEditService implements IPleromaAccountEditService {
  final editProfileRelativeUrlPath = "/api/v1/accounts/update_credentials";
  final IPleromaRestService restService;

  PleromaAccountEditService({@required this.restService});

  @override
  Future<Account> updateCredentials(PleromaAccountEdit accountData) async {
    _logger.finest(() => "updateCredentials $accountData");
    var httpResponse = await restService.sendHttpRequest(RestRequest.patch
      (relativePath: editProfileRelativeUrlPath,
        bodyJson: accountData.toJson()));


    return parseAccountResponse(httpResponse);
  }

  Account parseAccountResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return Account.fromJsonString(httpResponse.body);
    } else {
      throw new PleromaAccountEditException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<Account> updateFiles(PleromaAccountFiles accountFiles) async {
    _logger.finest(() => "updateFiles $accountFiles");
    var httpResponse = await restService.multipartRequest(
        httpMethod: HTTPMethod.PATCH,
        relativeUrlPath: editProfileRelativeUrlPath,
        files: {
          "header": accountFiles.header,
          "avatar": accountFiles.avatar,
        });


    return parseAccountResponse(httpResponse);
  }
}
