import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/pleroma/api/status/context/pleroma_api_status_context_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_exception.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaApiStatusService extends DisposableOwner
    implements IPleromaApiStatusService {
  final statusRelativeUrlPath = "/api/v1/statuses/";
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

  PleromaApiStatusService({required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<IPleromaApiStatus> getStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(statusRelativeUrlPath, statusRemoteId),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  PleromaApiStatus parseStatusResponse(Response httpResponse) {
    RestResponse<PleromaApiStatus> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiStatus.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  PleromaApiScheduledStatus parseScheduledStatusResponse(Response httpResponse) {
    RestResponse<PleromaApiScheduledStatus> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaApiScheduledStatus.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  PleromaApiStatusContext parseStatusContextResponse(Response httpResponse) {
    RestResponse<PleromaApiStatusContext> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiStatusContext.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<PleromaApiAccount> parseAccountsResponse(Response httpResponse) {
    RestResponse<List<PleromaApiAccount>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiAccount.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiStatusException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<PleromaApiStatusContext> getStatusContext({
    required String statusRemoteId,
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
