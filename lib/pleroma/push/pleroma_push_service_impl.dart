import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/push/pleroma_push_exception.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';

class PleromaPushService extends DisposableOwner
    implements IPleromaPushService {
  final subscriptionRelativeUrlPath = "api/v1/push/subscription";
  @override
  final IPleromaAuthRestService restService;
  final PleromaPushSubscriptionKeys keys;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaPushService({required this.restService, required this.keys});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  PleromaPushSubscription? parsePushSubscriptionResponse(
    Response httpResponse,
  ) {
    RestResponse<PleromaPushSubscription> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaPushSubscription.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaPushException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<PleromaPushSubscription?> subscribe({
    required String endpointCallbackUrl,
    required PleromaPushSubscribeData data,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: subscriptionRelativeUrlPath,
        bodyJson: PleromaPushSubscribeRequest(
          subscription: PleromaPushSubscribeRequestSubscription(
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
  Future<PleromaPushSubscription?> retrieveCurrentSubscription() async {
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
