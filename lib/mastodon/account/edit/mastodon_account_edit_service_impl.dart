import 'dart:io';

import 'package:fedi/mastodon/account/edit/mastodon_account_edit_exception.dart';
import 'package:fedi/mastodon/account/edit/mastodon_account_edit_service.dart';
import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/mastodon/rest/mastodon_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class MastodonAccountEditService implements IMastodonAccountEditService {
  final editProfileRelativeUrlPath = "/api/v1/accounts/update_credentials";
  final IMastodonRestService restService;

  MastodonAccountEditService({@required this.restService});

  @override
  Future<MastodonAccount> changeAvatarImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.patch(
            relativePath: editProfileRelativeUrlPath, files: {"avatar": file}));

    return parseResponse(httpResponse);
  }

  @override
  Future<MastodonAccount> changeHeaderImage({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.patch(
            relativePath: editProfileRelativeUrlPath, files: {"header": file}));

    return parseResponse(httpResponse);
  }

  MastodonAccount parseResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return MastodonAccount.fromJsonString(httpResponse.body);
    } else {
      throw new MastodonAccountEditException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
