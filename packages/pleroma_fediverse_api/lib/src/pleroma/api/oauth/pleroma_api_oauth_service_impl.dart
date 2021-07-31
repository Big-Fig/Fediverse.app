import 'dart:async';

import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/oauth/pleroma_api_oauth_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';

class PleromaApiOAuthService extends BasePleromaApiService
    implements IPleromaApiOAuthService {
  PleromaApiOAuthService({
    required IPleromaApiRestService restService,
  }) : super(
          restService: restService,
        );

  String extractAuthCodeFromUri(Uri uri) =>
      uri.queryParameters['code'].toString();

  @override
  Future<PleromaApiOAuthToken> retrieveAccountAccessToken({
    required PleromaApiOAuthAccountTokenRequest tokenRequest,
  }) async {
    var queryArgs = tokenRequest
        .toJson()
        .entries
        .map(
          (entry) => RestRequestQueryArg(
            key: entry.key,
            value: entry.value,
          ),
        )
        .toList();

    var request = RestRequest.post(
      relativePath: join(IPleromaApiOAuthService.oauthRelativeUrlPath, 'token'),
      queryArgs: queryArgs,
//        bodyJson: tokenRequest.toJson()
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiOAuthToken.fromJson,
    );
  }

  @override
  Future<PleromaApiOAuthToken> retrieveAppAccessToken({
    required PleromaApiOAuthAppTokenRequest tokenRequest,
  }) async {
    var request = RestRequest.post(
      relativePath: join(IPleromaApiOAuthService.oauthRelativeUrlPath, 'token'),
      bodyJson: tokenRequest.toJson(),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiOAuthToken.fromJson,
    );
  }

  @override
  Future revokeToken({
    required PleromaApiOAuthAppTokenRevokeRequest revokeRequest,
  }) async {
    var request = RestRequest.post(
      relativePath:
          join(IPleromaApiOAuthService.oauthRelativeUrlPath, 'revoke'),
      bodyJson: revokeRequest.toJson(),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processEmptyResponse(
      httpResponse,
    );
  }
}
