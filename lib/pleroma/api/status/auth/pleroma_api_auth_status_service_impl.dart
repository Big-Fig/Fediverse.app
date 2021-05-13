import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service_impl.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';

final _logger = Logger("pleroma_api_auth_status_service_impl.dart");

class PleromaApiAuthStatusService extends PleromaApiStatusService
    with PleromaApiAuthMixinService
    implements IPleromaApiAuthStatusService {
  final IPleromaApiAuthRestService authRestService;
  @override
  IPleromaApiAuthRestService get restApiAuthService => authRestService;

  PleromaApiAuthStatusService({
    required this.authRestService,
  }) : super(
          restService: authRestService,
        );

  @override
  Future deleteStatus({
    required String statusRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: join(statusRelativeUrlPath, statusRemoteId),
      ),
    );

    try {
      restService.processEmptyResponse(httpResponse);
    } catch(e) {
      if(e is PleromaApiRecordNotFoundRestException) {
        // nothing because already deleted on backend
        _logger.finest(() => "already deleted");
      } else {
        rethrow;
      }
    }

  }

  @override
  Future<IPleromaApiStatus> muteStatus({
    required String statusRemoteId,
    required int? expireDurationInSeconds,
  }) async {
    var bodyJson = <String, dynamic>{};
    if (expireDurationInSeconds != null) {
      assert(isPleroma, "expireDurationInSeconds supported only on Pleroma");
      bodyJson["expire_in"] = expireDurationInSeconds;
    }

    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "mute",
      ),
      bodyJson: bodyJson,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> unMuteStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unmute",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> pinStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "pin",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> unPinStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unpin",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiAccount>> favouritedBy({
    required String statusRemoteId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var request = RestRequest.get(
      queryArgs: pagination?.toQueryArgs(),
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "favourited_by",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiAccount>> rebloggedBy({
    required String statusRemoteId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var request = RestRequest.get(
      queryArgs: pagination?.toQueryArgs(),
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "reblogged_by",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> reblogStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "reblog",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> unReblogStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unreblog",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> favouriteStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "favourite",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> unFavouriteStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unfavourite",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> bookmarkStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "bookmark",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> unBookmarkStatus({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unbookmark",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> postStatus({
    required IPleromaApiPostStatus data,
  }) async {
    var json = data.toJson();

    var request = RestRequest.post(
      relativePath: statusRelativeUrlPath,
      headers: {
        if (data.idempotencyKey?.isNotEmpty == true)
          "Idempotency-Key": data.idempotencyKey!,
      },
      bodyJson: json,
    );

    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiScheduledStatus> scheduleStatus({
    required IPleromaApiScheduleStatus data,
  }) async {
    var json = data.toJson();

    var request = RestRequest.post(
      relativePath: statusRelativeUrlPath,
      bodyJson: json,
    );

    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiScheduledStatus.fromJson,
    );
  }

  @override
  bool get isMastodon => authRestService.isMastodon;
}
