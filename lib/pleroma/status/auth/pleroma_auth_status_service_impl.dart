import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service_impl.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class PleromaAuthStatusService extends PleromaStatusService
    implements IPleromaAuthStatusService {
  final IPleromaAuthRestService authRestService;

  @override
  bool get isPleromaInstance => authRestService.isPleromaInstance;

  PleromaAuthStatusService({
    @required this.authRestService,
  }) : super(
          restService: authRestService,
        );

  @override
  Future deleteStatus({
    @required String statusRemoteId,
  }) async {
    await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: join(statusRelativeUrlPath, statusRemoteId),
      ),
    );
  }

  @override
  Future<IPleromaStatus> muteStatus({
    @required String statusRemoteId,
    // @required Duration expireDurationInSeconds,

  }) async {

    var bodyJson = <String, String>{
    };
    // if (expireDurationInSeconds != null) {
    //   if (isPleromaInstance) {
    //     bodyJson["expire_in"] = expireDurationInSeconds.toString();
    //   } else {
    //     bodyJson["duration"] = expireDurationInSeconds.toString();
    //   }
    // }

    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "mute",
      ),
      bodyJson: bodyJson,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unMuteStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unmute",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> pinStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "pin",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unPinStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unpin",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> favouritedBy({
    @required String statusRemoteId,
    IPleromaPaginationRequest pagination,
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

    return parseAccountsResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> rebloggedBy({
    @required String statusRemoteId,
    IPleromaPaginationRequest pagination,
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

    return parseAccountsResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> reblogStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "reblog",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unReblogStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unreblog",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> favouriteStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "favourite",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unFavouriteStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unfavourite",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> bookmarkStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "bookmark",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> unBookmarkStatus({
    @required String statusRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        statusRelativeUrlPath,
        statusRemoteId,
        "unbookmark",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaStatus> postStatus({
    @required IPleromaPostStatus data,
  }) async {
    var json = data.toJson();

    var request = RestRequest.post(
      relativePath: statusRelativeUrlPath,
      headers: {
        if (data.idempotencyKey?.isNotEmpty == true)
          "Idempotency-Key": data.idempotencyKey,
      },
      bodyJson: json,
    );

    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaScheduledStatus> scheduleStatus({
    IPleromaScheduleStatus data,
  }) async {
    var json = data.toJson();

    assert(data.scheduledAt != null);
    var request = RestRequest.post(
      relativePath: statusRelativeUrlPath,
      bodyJson: json,
    );

    var httpResponse = await restService.sendHttpRequest(request);

    return parseScheduledStatusResponse(httpResponse);
  }
}
