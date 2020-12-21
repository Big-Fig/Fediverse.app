import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_exception.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaNotificationService extends DisposableOwner
    implements IPleromaNotificationService {
  final notificationRelativeUrlPath = "api/v1/notifications";
  @override
  final IPleromaAuthRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

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

  PleromaNotificationService({@required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<IPleromaNotification> getNotification({
    @required String notificationRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: join(
          notificationRelativeUrlPath,
          notificationRemoteId,
        ),
      ),
    );

    return parseNotificationResponse(httpResponse);
  }

  static const validTypes = {"follow", "favourite", "reblog", "mention"};

  // only default set of types (follow, favourite, reblog, mention, poll)
  // supported on all instances
  List<String> _removeInvalidExcludeTypes(List<String> excludeTypes) {
    return excludeTypes
        .where((type) => validTypes.contains(type.toLowerCase()))
        .toList();
  }

  @override
  Future<List<IPleromaNotification>> getNotifications({
    IPleromaPaginationRequest pagination,
    List<String> excludeTypes,
  }) async {
    excludeTypes = excludeTypes?.isNotEmpty == true
        ? _removeInvalidExcludeTypes(excludeTypes)
        : null;

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: notificationRelativeUrlPath,
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]) ,
          ...excludeTypes?.map(
            (excludeType) => RestRequestQueryArg(
              "exclude_types[]",
              excludeType,
            ),
          ),
        ],
      ),
    );

    return parseNotificationListResponse(httpResponse);
  }

  PleromaNotification parseNotificationResponse(Response httpResponse) {
    var body = httpResponse.body;

    // todo: report to pleroma
    if (body == null || body == "null") {
      return null;
    }
    RestResponse<PleromaNotification> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) {
        return PleromaNotification.fromJsonString(body);
      },
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaNotificationException(
        statusCode: httpResponse.statusCode,
        body: body,
      );
    }
  }

  List<PleromaNotification> parseNotificationListResponse(
    Response httpResponse,
  ) {
    RestResponse<List<PleromaNotification>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaNotification.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaNotificationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future dismissNotification({
    @required String notificationRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          notificationRelativeUrlPath,
          notificationRemoteId,
          "dismiss",
        ),
      ),
    );

    if (httpResponse.statusCode != 200) {
      throw PleromaNotificationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future dismissAll() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          notificationRelativeUrlPath,
          "clear",
        ),
      ),
    );

    if (httpResponse.statusCode != 200) {
      throw PleromaNotificationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
