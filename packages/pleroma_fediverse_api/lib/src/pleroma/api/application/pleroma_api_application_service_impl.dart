import 'dart:io';

import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/application/pleroma_api_application_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart';

class PleromaApiApplicationService extends BasePleromaApiService
    implements IPleromaApiApplicationService {
  final appsRelativeUrlPath = '/api/v1/apps/';

  PleromaApiApplicationService({
    required IPleromaApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IPleromaApiClientApplication> registerApp({
    required MastodonApiApplicationRegistrationRequest registrationRequest,
  }) async {
    var request = RestRequest.post(
      relativePath: appsRelativeUrlPath,
      bodyJson: registrationRequest.toJson(),
    );
    var httpResponse = await restService.sendHttpRequest(
      request,
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiClientApplication.fromJson,
    );
  }

  @override
  Future<IPleromaApiApplication> verifyCredentials({
    required String appToken,
  }) async {
    var request = RestRequest.get(
      relativePath: join(appsRelativeUrlPath, 'verify_credentials'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $appToken'},
    );
    var httpResponse = await restService.sendHttpRequest(
      request,
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiApplication.fromJson,
    );
  }
}
