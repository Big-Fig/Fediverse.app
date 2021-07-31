import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/push/pleroma_api_push_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';

class PleromaApiPushService extends BasePleromaApiService
    implements IPleromaApiPushService {
  final subscriptionRelativeUrlPath = 'api/v1/push/subscription';

  final PleromaApiPushSubscriptionKeys keys;

  PleromaApiPushService({
    required IPleromaApiAuthRestService restService,
    required this.keys,
  }) : super(
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
