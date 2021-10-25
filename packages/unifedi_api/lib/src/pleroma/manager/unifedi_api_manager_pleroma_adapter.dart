import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/account/my/service/unifedi_api_my_account_service.dart';
import '../../api/account/service/unifedi_api_account_service.dart';
import '../../api/announcement/service/unifedi_api_announcement_service.dart';
import '../../api/chat/service/unifedi_api_chat_service.dart';
import '../../api/conversation/service/unifedi_api_conversation_service.dart';
import '../../api/filter/service/unifedi_api_filter_service.dart';
import '../../api/instance/service/unifedi_api_instance_service.dart';
import '../../api/list/service/unifedi_api_list_service.dart';
import '../../api/manager/unifedi_api_manager.dart';
import '../../api/marker/service/unifedi_api_marker_service.dart';
import '../../api/media/attachment/service/unifedi_api_media_attachment_service.dart';
import '../../api/notification/service/unifedi_api_notification_service.dart';
import '../../api/poll/service/unifedi_api_poll_service.dart';
import '../../api/push/subscription/service/unifedi_api_push_subscription_service.dart';
import '../../api/search/service/unifedi_api_search_service.dart';
import '../../api/status/service/unifedi_api_status_service.dart';
import '../../api/timeline/service/unifedi_api_timeline_service.dart';
import '../../api/web_sockets/unifedi_api_web_sockets_service.dart';
import '../account/my/service/unifedi_api_my_account_service_impl_pleroma_adapter.dart';
import '../account/service/unifedi_api_account_service_impl_pleroma_adapter.dart';
import '../announcement/service/unifedi_api_announcement_service_impl_pleroma_adapter.dart';
import '../chat/service/unifedi_api_chat_service_impl_pleroma_adapter.dart';
import '../conversation/service/unifedi_api_conversation_service_impl_pleroma_adapter.dart';
import '../filter/service/unifedi_api_filter_service_impl_pleroma_adapter.dart';
import '../instance/service/unifedi_api_instance_service_impl_pleroma_adapter.dart';
import '../list/service/unifedi_api_list_service_impl_pleroma_adapter.dart';
import '../marker/service/unifedi_api_marker_service_impl_pleroma_adapter.dart';
import '../media/attachment/service/unifedi_api_media_attachment_service_impl_pleroma_adapter.dart';
import '../notification/service/unifedi_api_notification_service_impl_pleroma_adapter.dart';
import '../poll/service/unifedi_api_poll_service_impl_pleroma_adapter.dart';
import '../push/subscription/service/unifedi_api_push_subscription_service_impl_pleroma_adapter.dart';
import '../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../search/service/unifedi_api_search_service_impl_pleroma_adapter.dart';
import '../status/service/unifedi_api_account_service_impl_pleroma_adapter.dart';
import '../timeline/service/unifedi_api_timeline_service_impl_pleroma_adapter.dart';
import '../web_sockets/unifedi_api_websockets_service_impl_pleroma_adapter.dart';

class UnifediApiManagerPleromaAdapter extends DisposableOwner
    implements IUnifediApiManager {
  final IPleromaApiManager apiManager;

  UnifediApiManagerPleromaAdapter({
    required this.apiManager,
  });

  @override
  IUnifediApiAccountService createAccountService() =>
      UnifediApiAccountServicePleromaAdapter(
        pleromaApiAccountUserAccessService:
            apiManager.createAccountUserAccessService(),
      );

  @override
  IUnifediApiAnnouncementService createAnnouncementService() =>
      UnifediApiAnnouncementServicePleromaAdapter(
        pleromaApiAnnouncementUserAccessService:
            apiManager.createAnnouncementUserAccessService(),
      );

  @override
  IUnifediApiMyAccountService createMyAccountService() =>
      UnifediApiMyAccountServicePleromaAdapter(
        pleromaApiMyAccountUserAccessService:
            apiManager.createMyAccountUserAccessService(),
      );

  @override
  IUnifediApiChatService createChatService() =>
      UnifediApiChatServicePleromaAdapter(
        pleromaApiChatUserAccessService:
            apiManager.createChatUserAccessService(),
      );

  @override
  IUnifediApiConversationService createConversationService() =>
      UnifediApiConversationServicePleromaAdapter(
        pleromaApiConversationUserAccessService:
            apiManager.createConversationUserAccessService(),
      );

  @override
  IUnifediApiFilterService createFilterService() =>
      UnifediApiFilterServicePleromaAdapter(
        pleromaApiFilterUserAccessService:
            apiManager.createFilterUserAccessService(),
      );

  @override
  IUnifediApiInstanceService createInstanceService() =>
      UnifediApiInstanceServicePleromaAdapter(
        pleromaApiInstancePublicAccessService:
            apiManager.createInstancePublicAccessService(),
      );

  @override
  IUnifediApiListService createListService() =>
      UnifediApiListServicePleromaAdapter(
        pleromaApiListUserAccessService:
            apiManager.createListUserAccessService(),
      );

  @override
  IUnifediApiMarkerService createMarkerService() =>
      UnifediApiMarkerServicePleromaAdapter(
        pleromaApiMarkerUserAccessService:
            apiManager.createMarkerUserAccessService(),
      );

  @override
  IUnifediApiMediaAttachmentService createMediaAttachmentService() =>
      UnifediApiMediaAttachmentServicePleromaAdapter(
        pleromaApiMediaAttachmentUserAccessService:
            apiManager.createMediaAttachmentUserAccessService(),
      );

  @override
  IUnifediApiNotificationService createNotificationService() =>
      UnifediApiNotificationServicePleromaAdapter(
        pleromaApiNotificationUserAccessService:
            apiManager.createNotificationUserAccessService(),
      );

  @override
  IUnifediApiPushSubscriptionService createPushSubscriptionService() =>
      UnifediApiPushSubscriptionServicePleromaAdapter(
        pleromaApiPushSubscriptionUserAccessService:
            apiManager.createPushSubscriptionUserAccessService(),
      );

  @override
  IUnifediApiSearchService createSearchService() =>
      UnifediApiSearchServicePleromaAdapter(
        pleromaApiSearchUserAccessService:
            apiManager.createSearchUserAccessService(),
      );

  @override
  IUnifediApiStatusService createStatusService() =>
      UnifediApiStatusServicePleromaAdapter(
        pleromaApiStatusUserAccessService:
            apiManager.createStatusUserAccessService(),
      );

  @override
  IUnifediApiTimelineService createTimelineService() =>
      UnifediApiTimelineServicePleromaAdapter(
        pleromaApiTimelineUserAccessService:
            apiManager.createTimelineUserAccessService(),
      );

  @override
  IUnifediApiWebSocketsService createWebSocketsService() =>
      UnifediApiWebSocketsServicePleromaAdapter(
        restService: UnifediApiRestServicePleromaAdapter(
          pleromaApiRestService: apiManager.apiRestService,
        ),
        pleromaApiWebSocketsService: apiManager.createWebSocketsService(),
      );

  @override
  IUnifediApiPollService createPollService() =>
      UnifediApiPollServicePleromaAdapter(
        pleromaApiPollUserAccessService:
            apiManager.createPollUserAccessService(),
      );
}
