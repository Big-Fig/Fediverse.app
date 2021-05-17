import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';

class PleromaApiPushService extends BasePleromaApiService
    implements IPleromaApiPushService {
  final subscriptionRelativeUrlPath = 'api/v1/push/subscription';
  @override
  final IPleromaApiAuthRestService restService;
  final PleromaApiPushSubscriptionKeys keys;

  PleromaApiPushService({required this.restService, required this.keys})
      : super(
          restService: restService,
        );

  @override
  Future<PleromaApiPushSubscription> subscribe({
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

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiPushSubscription.fromJson,
    );
  }

  @override
  Future<PleromaApiPushSubscription> retrieveCurrentSubscription() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: subscriptionRelativeUrlPath,
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiPushSubscription.fromJson,
    );
  }

  @override
  Future unsubscribe() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: subscriptionRelativeUrlPath,
      ),
    );

    return restService.processEmptyResponse(
      httpResponse,
    );
  }
}
