import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_exception.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaApiNotificationService extends DisposableOwner
    implements IPleromaApiNotificationService {
  final notificationRelativeUrlPath = "api/v1/notifications";
  final pleromaNotificationRelativeUrlPath = "api/v1/pleroma/notifications";
  @override
  final IPleromaApiAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiNotificationService({required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<IPleromaApiNotification> getNotification({
    required String? notificationRemoteId,
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

  @override
  Future<IPleromaApiNotification> markAsReadSingle({
    required String? notificationRemoteId,
  }) async {
    assert(
      restService.isPleroma,
      "markAsRead notification works only on pleroma",
    );

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          pleromaNotificationRelativeUrlPath,
          "read",
        ),
        bodyJson: <String, dynamic>{
          "id": notificationRemoteId,
        },
      ),
    );

    return parseNotificationResponse(httpResponse);
  }

  @override
  Future<List<IPleromaApiNotification>> markAsReadList({
    required String? maxNotificationRemoteId,
  }) async {
    assert(
      restService.isPleroma,
      "markAsRead notification works only on pleroma",
    );

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          pleromaNotificationRelativeUrlPath,
          "read",
        ),
        bodyJson: <String, dynamic>{
          if (maxNotificationRemoteId != null)
            "max_id": maxNotificationRemoteId,
        },
      ),
    );

    return parseNotificationListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaApiNotification>> getNotifications({
    IPleromaApiPaginationRequest? pagination,
    List<PleromaApiNotificationType>? excludeTypes,
    String? onlyFromAccountRemoteId,
    List<PleromaApiNotificationType>? includeTypes,
    List<PleromaApiVisibility>? excludeVisibilities,
  }) async {
    _checkGetNotificationsIncludeTypes(includeTypes);

    _checkGetNotificationsExcludeVisibilities(excludeVisibilities);
    excludeTypes = _checkGetNotificationsExcludeTypes(excludeTypes);

    _checkGetNotificationsOnlyFromAccountRemoteId(onlyFromAccountRemoteId);

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: notificationRelativeUrlPath,
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
          if (excludeTypes?.isNotEmpty == true)
            ...excludeTypes?.map(
                  (excludeType) => RestRequestQueryArg(
                    "exclude_types[]",
                    excludeType.toJsonValue(),
                  ),
                ) ??
                [],
          if (includeTypes?.isNotEmpty == true)
            ...includeTypes?.map(
                  (includeType) => RestRequestQueryArg(
                    "include_types[]",
                    includeType.toJsonValue(),
                  ),
                ) ??
                [],
          if (excludeVisibilities?.isNotEmpty == true)
            ...excludeVisibilities?.map(
                  (excludeVisibility) => RestRequestQueryArg(
                    "exclude_visibilities[]",
                    excludeVisibility.toJsonValue(),
                  ),
                ) ??
                [],
        ],
      ),
    );

    return parseNotificationListResponse(httpResponse);
  }

  void _checkGetNotificationsOnlyFromAccountRemoteId(
    String? onlyFromAccountRemoteId,
  ) {
    if (onlyFromAccountRemoteId != null) {
      // todo: remove when pleroma will support
      assert(
        restService.isMastodon,
        "Not supported on Pleroma. "
        "onlyFromAccountRemoteId added only in Mastodon 2.9.0 "
        "but Pleroma targets Mastodon 2.7.2 API",
      );
    }
  }

  List<PleromaApiNotificationType>? _checkGetNotificationsExcludeTypes(
    List<PleromaApiNotificationType>? excludeTypes,
  ) {
    if (excludeTypes?.isNotEmpty == true) {
      if (restService.isMastodon) {
        excludeTypes = excludeTypes!
            .where(
              (excludeType) => IPleromaApiNotificationService
                  .validMastodonTypesToExclude
                  .contains(excludeType),
            )
            .toList();
      } else if (restService.isPleroma) {
        excludeTypes = excludeTypes!
            .where(
              (excludeType) => IPleromaApiNotificationService
                  .validPleromaTypesToExclude
                  .contains(excludeType),
            )
            .toList();
      }
    }
    return excludeTypes;
  }

  void _checkGetNotificationsExcludeVisibilities(
    List<PleromaApiVisibility>? excludeVisibilities,
  ) {
    if (excludeVisibilities?.isNotEmpty == true) {
      assert(restService.isPleroma);
      for (PleromaApiVisibility excludeVisibility in excludeVisibilities!) {
        assert(
          IPleromaApiNotificationService.validPleromaVisibilityToExclude
              .contains(excludeVisibility),
          "excludeVisibility $excludeVisibility not supported on backend",
        );
      }
    }
  }

  void _checkGetNotificationsIncludeTypes(
      List<PleromaApiNotificationType>? includeTypes) {
    if (includeTypes?.isNotEmpty == true) {
      assert(restService.isPleroma);
      for (PleromaApiNotificationType includeType in includeTypes!) {
        assert(
          IPleromaApiNotificationService.validPleromaTypesToInclude
              .contains(includeType),
          "includeType $includeType not supported on backend",
        );
      }
    }
  }

  PleromaApiNotification parseNotificationResponse(Response httpResponse) {
    var body = httpResponse.body;

    RestResponse<PleromaApiNotification> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) {
        return PleromaApiNotification.fromJsonString(body);
      },
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiNotificationException(
        statusCode: httpResponse.statusCode,
        body: body,
      );
    }
  }

  List<PleromaApiNotification> parseNotificationListResponse(
    Response httpResponse,
  ) {
    RestResponse<List<PleromaApiNotification>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiNotification.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiNotificationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future dismissNotification({
    required String? notificationRemoteId,
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

    if (httpResponse.statusCode != RestResponse.successResponseStatusCode) {
      throw PleromaApiNotificationException(
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

    if (httpResponse.statusCode != RestResponse.successResponseStatusCode) {
      throw PleromaApiNotificationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  bool get isPleroma => restService.isPleroma;

  @override
  bool get isMastodon => restService.isMastodon;
}
