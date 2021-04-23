import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_exception.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';

class PleromaApiPushService extends DisposableOwner
    implements IPleromaApiPushService {
  final subscriptionRelativeUrlPath = "api/v1/push/subscription";
  @override
  final IPleromaApiAuthRestService restService;
  final PleromaApiPushSubscriptionKeys keys;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiPushService({required this.restService, required this.keys});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  PleromaApiPushSubscription? parsePushSubscriptionResponse(
    Response httpResponse,
  ) {
    RestResponse<PleromaApiPushSubscription> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaApiPushSubscription.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaApiPushException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<PleromaApiPushSubscription?> subscribe({
    required String endpointCallbackUrl,
    required PleromaApiPushSubscribeData data,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: subscriptionRelativeUrlPath,
        bodyJson: PleromaApiPushSubscribeRequest(
          subscription: PleromaApiPushSubscribeRequestSubscription(
            endpoint: endpointCallbackUrl,
            keys: keys,
          ),
          data: data,
        ).toJson(),
      ),
    );

    return parsePushSubscriptionResponse(httpResponse);
  }

  @override
  Future<PleromaApiPushSubscription?> retrieveCurrentSubscription() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: subscriptionRelativeUrlPath,
      ),
    );

    return parsePushSubscriptionResponse(httpResponse);
  }

  @override
  Future<bool> unsubscribe() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: subscriptionRelativeUrlPath,
      ),
    );

    return httpResponse.statusCode == RestResponse.successResponseStatusCode;
  }
}
