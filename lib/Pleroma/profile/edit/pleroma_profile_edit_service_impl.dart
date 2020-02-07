import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/profile/edit/pleroma_profile_edit_error.dart';
import 'package:fedi/Pleroma/profile/edit/pleroma_profile_edit_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';

class PleromaProfileEditService implements IPleromaProfileEditService {
  final editProfileRelativeUrlPath = "/api/v1/accounts/update_credentials";
  final IPleromaRestService restService;

  PleromaProfileEditService(this.restService);

  @override
  Future<String> changeAvatarImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        httpMethod: HTTPMethod.PATCH,
        file: file,
        fileParamKey: "avatar",
        relativeUrlPath: editProfileRelativeUrlPath);

    return parseResponse(httpResponse);
  }

  @override
  Future<String> changeHeaderImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        httpMethod: HTTPMethod.PATCH,
        file: file,
        fileParamKey: "header",
        relativeUrlPath: editProfileRelativeUrlPath);

    return parseResponse(httpResponse);
  }

  String parseResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return httpResponse.body;
    } else {
      throw new PleromaProfileEditError(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
