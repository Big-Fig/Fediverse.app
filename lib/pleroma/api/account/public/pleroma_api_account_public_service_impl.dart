import 'dart:io';

import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_model.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiAccountPublicService extends BasePleromaApiService
    implements IPleromaApiAccountPublicService {
  final accountRelativeUrlPath = "/api/v1/accounts/";
  @override
  final IPleromaApiRestService restService;

  PleromaApiAccountPublicService({
    required this.restService,
  }) : super(restService: restService);

  @override
  Future<PleromaApiOAuthToken> registerAccount({
    required IPleromaApiAccountPublicRegisterRequest request,
    required String? appAccessToken,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(accountRelativeUrlPath),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $appAccessToken",
        },
        bodyJson: request.toJson(),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiOAuthToken.fromJson,
    );
  }
}
