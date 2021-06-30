import 'dart:io';

import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
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
