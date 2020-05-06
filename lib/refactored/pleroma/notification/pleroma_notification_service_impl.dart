import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_exception.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:fedi/refactored/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaNotificationService implements IPleromaNotificationService {
  final notificationRelativeUrlPath = "api/v1/notifications";
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaNotificationService({@required this.restService});

  @override
  void dispose() {
    // nothing
  }

  @override
  Future<IPleromaNotification> getNotification(
      {@required String notificationRemoteId}) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: join(notificationRelativeUrlPath, notificationRemoteId)));

    return parseNotificationResponse(httpResponse);
  }

  @override
  Future<List<IPleromaNotification>> getNotifications(
      {@required MastodonNotificationsRequest request}) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: notificationRelativeUrlPath,
        queryArgs: RestRequestQueryArg.listFromJson(request.toJson())));

    return parseNotificationListResponse(httpResponse);
  }

  PleromaNotification parseNotificationResponse(Response httpResponse) {
    RestResponse<PleromaNotification> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaNotification.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaNotificationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<PleromaNotification> parseNotificationListResponse(
      Response httpResponse) {
    RestResponse<List<PleromaNotification>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaNotification.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaNotificationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
