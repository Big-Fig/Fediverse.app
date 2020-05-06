import 'dart:io';

import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_exception.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_service.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaAccountPublicService extends IPleromaAccountPublicService {
  final accountRelativeUrlPath = "/api/v1/accounts/";
  final IPleromaRestService restService;

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

  PleromaAccountPublicService({@required this.restService});

  @override
  Future<bool> registerAccount(
      {@required IPleromaAccountRegisterRequest request,
      @required String appAccessToken}) async {
    assert(request != null);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
        relativePath: urlPath.join(accountRelativeUrlPath),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $appAccessToken",
        },
        bodyJson: request.toJson()));

    if (httpResponse.statusCode == 200) {
      return true;
    } else {
      throw PleromaAccountPublicException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  void dispose() {}
}
