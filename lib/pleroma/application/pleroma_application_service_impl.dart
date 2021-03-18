import 'dart:io';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/application/mastodon_application_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/application/pleroma_application_exception.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaApplicationService extends DisposableOwner
    implements IPleromaApplicationService {
  final appsRelativeUrlPath = "/api/v1/apps/";
  @override
  final IPleromaRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApplicationService({required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  PleromaApplication? parseApplicationResponse(Response httpResponse) {
    RestResponse<PleromaApplication> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaApplication.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaApplicationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  PleromaClientApplication? parseClientApplicationResponse(
      Response httpResponse) {
    RestResponse<PleromaClientApplication> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaClientApplication.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaApplicationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<IPleromaClientApplication?> registerApp(
      {required MastodonApplicationRegistrationRequest
          registrationRequest}) async {
    var request = RestRequest.post(
        relativePath: appsRelativeUrlPath,
        bodyJson: registrationRequest.toJson());
    var httpResponse = await restService.sendHttpRequest(
      request,
    );

    return parseClientApplicationResponse(httpResponse);
  }

  @override
  Future<IPleromaApplication?> verifyCredentials(
      {required String appToken}) async {
    var request = RestRequest.get(
        relativePath: join(appsRelativeUrlPath, "verify_credentials"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $appToken"});
    var httpResponse = await restService.sendHttpRequest(
      request,
    );

    return parseApplicationResponse(httpResponse);
  }
}
