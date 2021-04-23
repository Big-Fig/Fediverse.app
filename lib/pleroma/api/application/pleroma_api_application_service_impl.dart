import 'dart:io';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_exception.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaApiApplicationService extends DisposableOwner
    implements IPleromaApiApplicationService {
  final appsRelativeUrlPath = "/api/v1/apps/";
  @override
  final IPleromaApiRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiApplicationService({required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  PleromaApiApplication? parseApplicationResponse(Response httpResponse) {
    RestResponse<PleromaApiApplication> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaApiApplication.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaApiApplicationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  PleromaApiClientApplication? parseClientApplicationResponse(
    Response httpResponse,
  ) {
    RestResponse<PleromaApiClientApplication> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaApiClientApplication.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaApiApplicationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<IPleromaApiClientApplication?> registerApp({
    required MastodonApiApplicationRegistrationRequest registrationRequest,
  }) async {
    var request = RestRequest.post(
      relativePath: appsRelativeUrlPath,
      bodyJson: registrationRequest.toJson(),
    );
    var httpResponse = await restService.sendHttpRequest(
      request,
    );

    return parseClientApplicationResponse(httpResponse);
  }

  @override
  Future<IPleromaApiApplication?> verifyCredentials({
    required String appToken,
  }) async {
    var request = RestRequest.get(
      relativePath: join(appsRelativeUrlPath, "verify_credentials"),
      headers: {HttpHeaders.authorizationHeader: "Bearer $appToken"},
    );
    var httpResponse = await restService.sendHttpRequest(
      request,
    );

    return parseApplicationResponse(httpResponse);
  }
}
