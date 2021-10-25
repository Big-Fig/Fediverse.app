import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

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
import '../account/my/service/unifedi_api_my_account_service_impl_mastodon_adapter.dart';
import '../account/service/unifedi_api_account_service_impl_mastodon_adapter.dart';
import '../announcement/service/unifedi_api_announcement_service_impl_mastodon_adapter.dart';
import '../chat/service/unifedi_api_chat_service_impl_mastodon_adapter.dart';
import '../conversation/service/unifedi_api_conversation_service_impl_mastodon_adapter.dart';
import '../filter/service/unifedi_api_filter_service_impl_mastodon_adapter.dart';
import '../instance/service/unifedi_api_instance_service_impl_mastodon_adapter.dart';
import '../list/service/unifedi_api_list_service_impl_mastodon_adapter.dart';
import '../marker/service/unifedi_api_marker_service_impl_mastodon_adapter.dart';
import '../media/attachment/service/unifedi_api_media_attachment_service_impl_mastodon_adapter.dart';
import '../notification/service/unifedi_api_notification_service_impl_mastodon_adapter.dart';
import '../poll/service/unifedi_api_poll_service_impl_mastodon_adapter.dart';
import '../push/subscription/service/unifedi_api_push_subscription_service_impl_mastodon_adapter.dart';
import '../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../search/service/unifedi_api_search_service_impl_mastodon_adapter.dart';
import '../status/service/unifedi_api_account_service_impl_mastodon_adapter.dart';
import '../timeline/service/unifedi_api_timeline_service_impl_mastodon_adapter.dart';
import '../web_sockets/unifedi_api_websockets_service_impl_mastodon_adapter.dart';

class UnifediApiManagerMastodonAdapter extends DisposableOwner
    implements IUnifediApiManager {
  final IMastodonApiManager apiManager;

  UnifediApiManagerMastodonAdapter({
    required this.apiManager,
  });

  @override
  IUnifediApiAccountService createAccountService() =>
      UnifediApiAccountServiceMastodonAdapter(
        mastodonApiAccountUserAccessService:
            apiManager.createAccountUserAccessService(),
      );

  @override
  IUnifediApiAnnouncementService createAnnouncementService() =>
      UnifediApiAnnouncementServiceMastodonAdapter(
        mastodonApiAnnouncementUserAccessService:
            apiManager.createAnnouncementUserAccessService(),
      );

  @override
  IUnifediApiMyAccountService createMyAccountService() =>
      UnifediApiMyAccountServiceMastodonAdapter(
        mastodonApiMyAccountUserAccessService:
            apiManager.createMyAccountUserAccessService(),
      );

  @override
  IUnifediApiChatService createChatService() =>
      UnifediApiChatServiceMastodonAdapter(
        restService: UnifediApiRestServiceMastodonAdapter(
          mastodonApiRestService: apiManager.apiRestService,
        ),
      );

  @override
  IUnifediApiConversationService createConversationService() =>
      UnifediApiConversationServiceMastodonAdapter(
        mastodonApiConversationUserAccessService:
            apiManager.createConversationUserAccessService(),
      );

  @override
  IUnifediApiFilterService createFilterService() =>
      UnifediApiFilterServiceMastodonAdapter(
        mastodonApiFilterUserAccessService:
            apiManager.createFilterUserAccessService(),
      );

  @override
  IUnifediApiInstanceService createInstanceService() =>
      UnifediApiInstanceServiceMastodonAdapter(
        mastodonApiInstancePublicAccessService:
            apiManager.createInstancePublicAccessService(),
      );

  @override
  IUnifediApiListService createListService() =>
      UnifediApiListServiceMastodonAdapter(
        mastodonApiListUserAccessService:
            apiManager.createListUserAccessService(),
      );

  @override
  IUnifediApiMarkerService createMarkerService() =>
      UnifediApiMarkerServiceMastodonAdapter(
        mastodonApiMarkerUserAccessService:
            apiManager.createMarkerUserAccessService(),
      );

  @override
  IUnifediApiMediaAttachmentService createMediaAttachmentService() =>
      UnifediApiMediaAttachmentServiceMastodonAdapter(
        mastodonApiMediaAttachmentUserAccessService:
            apiManager.createMediaAttachmentUserAccessService(),
      );

  @override
  IUnifediApiNotificationService createNotificationService() =>
      UnifediApiNotificationServiceMastodonAdapter(
        mastodonApiNotificationUserAccessService:
            apiManager.createNotificationUserAccessService(),
      );

  @override
  IUnifediApiPushSubscriptionService createPushSubscriptionService() =>
      UnifediApiPushSubscriptionServiceMastodonAdapter(
        mastodonApiPushSubscriptionUserAccessService:
            apiManager.createPushSubscriptionUserAccessService(),
      );

  @override
  IUnifediApiSearchService createSearchService() =>
      UnifediApiSearchServiceMastodonAdapter(
        mastodonApiSearchUserAccessService:
            apiManager.createSearchUserAccessService(),
      );

  @override
  IUnifediApiStatusService createStatusService() =>
      UnifediApiStatusServiceMastodonAdapter(
        mastodonApiStatusUserAccessService:
            apiManager.createStatusUserAccessService(),
      );

  @override
  IUnifediApiTimelineService createTimelineService() =>
      UnifediApiTimelineServiceMastodonAdapter(
        mastodonApiTimelineUserAccessService:
            apiManager.createTimelineUserAccessService(),
      );

  @override
  IUnifediApiWebSocketsService createWebSocketsService() =>
      UnifediApiWebSocketsServiceMastodonAdapter(
        restService: UnifediApiRestServiceMastodonAdapter(
          mastodonApiRestService: apiManager.apiRestService,
        ),
        mastodonApiWebSocketsService: apiManager.createWebSocketsService(),
      );

  @override
  IUnifediApiPollService createPollService() =>
      UnifediApiPollServiceMastodonAdapter(
        mastodonApiPollUserAccessService:
            apiManager.createPollUserAccessService(),
      );
}
