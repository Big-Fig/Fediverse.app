import 'dart:io';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_exception.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service.dart';
import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/Pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class PleromaAccountEditService implements IPleromaAccountEditService {
  final editAccountRelativeUrlPath = "/api/v1/accounts/update_credentials";
  final IPleromaAuthRestService restService;


  @override
  Stream<PleromaApiState> get pleromaStateStream => restService.pleromaStateStream;

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

  PleromaAccountEditService({@required this.restService});

  @override
  Future<IPleromaAccount> changeAvatarImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.patch(
            relativePath: editAccountRelativeUrlPath, files: {"avatar": file}));

    return parseResponse(httpResponse);
  }

  @override
  Future<IPleromaAccount> changeHeaderImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.patch(
            relativePath: editAccountRelativeUrlPath, files: {"header": file}));

    return parseResponse(httpResponse);
  }

  IPleromaAccount parseResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccount.fromJsonString(httpResponse.body);
    } else {
      throw new PleromaAccountEditException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  void dispose() {
    // nothing
  }
}
