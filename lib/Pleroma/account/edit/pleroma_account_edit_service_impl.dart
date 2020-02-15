import 'dart:io';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_exception.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class PleromaAccountEditService implements IPleromaAccountEditService {
  final editProfileRelativeUrlPath = "/api/v1/accounts/update_credentials";
  final IPleromaRestService restService;

  PleromaAccountEditService({@required this.restService});

  @override
  Future<Account> changeAvatarImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.patch(
            relativePath: editProfileRelativeUrlPath, files: {"avatar": file}));

    return parseResponse(httpResponse);
  }

  @override
  Future<Account> changeHeaderImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.patch(
            relativePath: editProfileRelativeUrlPath, files: {"header": file}));

    return parseResponse(httpResponse);
  }

  Account parseResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return Account.fromJsonString(httpResponse.body);
    } else {
      throw new PleromaAccountEditException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
