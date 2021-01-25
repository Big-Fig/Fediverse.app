import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/pleroma/status/context/pleroma_status_context_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_exception.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaStatusService extends DisposableOwner
    implements IPleromaStatusService {
  final statusRelativeUrlPath = "/api/v1/statuses/";
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

  PleromaStatusService({@required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<IPleromaStatus> getStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(statusRelativeUrlPath, statusRemoteId),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  PleromaStatus parseStatusResponse(Response httpResponse) {
    RestResponse<PleromaStatus> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaStatus.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  PleromaScheduledStatus parseScheduledStatusResponse(Response httpResponse) {
    RestResponse<PleromaScheduledStatus> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaScheduledStatus.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  PleromaStatusContext parseStatusContextResponse(Response httpResponse) {
    RestResponse<PleromaStatusContext> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaStatusContext.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<PleromaAccount> parseAccountsResponse(Response httpResponse) {
    RestResponse<List<PleromaAccount>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaAccount.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<PleromaStatusContext> getStatusContext({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "context",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusContextResponse(httpResponse);
  }
}
