import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/pleroma_api_access_bloc.dart';
import '../account/my/service/access/user/pleroma_api_my_account_user_access_service_impl.dart';
import '../account/service/access/application/pleroma_api_account_application_access_service_impl.dart';
import '../account/service/access/public/pleroma_api_account_public_access_service_impl.dart';
import '../account/service/access/user/pleroma_api_account_user_access_service_impl.dart';
import '../announcement/service/access/user/pleroma_api_announcement_user_access_service_impl.dart';
import '../chat/service/access/user/pleroma_api_chat_user_access_service_impl.dart';
import '../conversation/service/access/user/pleroma_api_conversation_user_access_service_impl.dart';
import '../filter/service/access/user/pleroma_api_filter_user_access_service_impl.dart';
import '../instance/service/access/public/pleroma_api_instance_public_access_service_impl.dart';
import '../list/service/access/user/pleroma_api_list_user_access_service_impl.dart';
import '../marker/service/access/user/pleroma_api_marker_user_access_service_impl.dart';
import '../media/attachment/service/access/user/pleroma_api_media_attachment_user_access_service_impl.dart';
import '../notification/service/access/user/pleroma_api_notification_user_access_service_impl.dart';
import '../poll/service/access/public/pleroma_api_poll_public_access_service_impl.dart';
import '../poll/service/access/user/pleroma_api_poll_user_access_service_impl.dart';
import '../push/subscription/service/access/user/pleroma_api_push_subscription_user_access_service_impl.dart';
import '../rest/pleroma_api_rest_service_impl.dart';
import '../search/service/access/user/pleroma_api_search_user_access_service_impl.dart';
import '../status/service/access/public/pleroma_api_status_public_access_service_impl.dart';
import '../status/service/access/user/pleroma_api_status_user_access_service_impl.dart';
import '../timeline/service/access/public/pleroma_api_timeline_public_access_service_impl.dart';
import '../timeline/service/access/user/pleroma_api_timeline_user_access_service_impl.dart';
import '../web_sockets/pleroma_api_web_sockets_service_impl.dart';
import 'pleroma_api_manager.dart';

class PleromaApiManager extends DisposableOwner implements IPleromaApiManager {
  @override
  final IPleromaApiAccessBloc accessBloc;

  @override
  final PleromaApiRestService apiRestService;
  @override
  final IWebSocketsService webSocketsService;
  @override
  final IRestService restService;

  PleromaApiManager({
    required this.accessBloc,
    required this.restService,
    required this.webSocketsService,
  }) : apiRestService = PleromaApiRestService(
          accessBloc: accessBloc,
          restService: restService,
        );

  @override
  PleromaApiAccountApplicationAccessService
      createAccountApplicationAccessService() =>
          PleromaApiAccountApplicationAccessService(
            restService: apiRestService,
          );

  @override
  PleromaApiAccountPublicAccessService createAccountPublicAccessService() =>
      PleromaApiAccountPublicAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiAccountUserAccessService createAccountUserAccessService() =>
      PleromaApiAccountUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiAnnouncementUserAccessService
      createAnnouncementUserAccessService() =>
          PleromaApiAnnouncementUserAccessService(
            restService: apiRestService,
          );

  @override
  PleromaApiMyAccountUserAccessService createMyAccountUserAccessService() =>
      PleromaApiMyAccountUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiChatUserAccessService createChatUserAccessService() =>
      PleromaApiChatUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiConversationUserAccessService
      createConversationUserAccessService() =>
          PleromaApiConversationUserAccessService(
            restService: apiRestService,
          );

  @override
  PleromaApiFilterUserAccessService createFilterUserAccessService() =>
      PleromaApiFilterUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiInstancePublicAccessService createInstancePublicAccessService() =>
      PleromaApiInstancePublicAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiListUserAccessService createListUserAccessService() =>
      PleromaApiListUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiMarkerUserAccessService createMarkerUserAccessService() =>
      PleromaApiMarkerUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiMediaAttachmentUserAccessService
      createMediaAttachmentUserAccessService() =>
          PleromaApiMediaAttachmentUserAccessService(
            restService: apiRestService,
          );

  @override
  PleromaApiNotificationUserAccessService
      createNotificationUserAccessService() =>
          PleromaApiNotificationUserAccessService(
            restService: apiRestService,
          );

  @override
  PleromaApiPushSubscriptionUserAccessService
      createPushSubscriptionUserAccessService() =>
          PleromaApiPushSubscriptionUserAccessService(
            restService: apiRestService,
          );

  @override
  PleromaApiSearchUserAccessService createSearchUserAccessService() =>
      PleromaApiSearchUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiStatusPublicAccessService createStatusPublicAccessService() =>
      PleromaApiStatusPublicAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiStatusUserAccessService createStatusUserAccessService() =>
      PleromaApiStatusUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiTimelinePublicAccessService createTimelinePublicAccessService() =>
      PleromaApiTimelinePublicAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiTimelineUserAccessService createTimelineUserAccessService() =>
      PleromaApiTimelineUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiPollUserAccessService createPollUserAccessService() =>
      PleromaApiPollUserAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiPollPublicAccessService createPollPublicAccessService() =>
      PleromaApiPollPublicAccessService(
        restService: apiRestService,
      );

  @override
  PleromaApiWebSocketsService createWebSocketsService() =>
      PleromaApiWebSocketsService(
        accessBloc: accessBloc,
        webSocketsService: webSocketsService,
      );
}
