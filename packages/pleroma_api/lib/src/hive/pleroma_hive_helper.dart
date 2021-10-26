// ignore_for_file: cascade_invocations

import 'package:hive/hive.dart';

import '../api/access/level/pleroma_api_access_level_model_impl.dart';
import '../api/access/pleroma_api_access_model_impl.dart';
import '../api/access/scopes/item/pleroma_api_access_scopes_item_model_impl.dart';
import '../api/access/scopes/pleroma_api_access_scopes_model_impl.dart';
import '../api/account/identity_proof/pleroma_api_account_identity_proof_model_impl.dart';
import '../api/account/my/edit/pleroma_api_edit_my_account_model_impl.dart';
import '../api/account/my/notifications_settings/pleroma_api_my_account_notifications_settings_model_impl.dart';
import '../api/account/my/pleroma_api_my_account_model_impl.dart';
import '../api/account/my/source/pleroma_api_my_account_source_model_impl.dart';
import '../api/account/pleroma_api_account_model_impl.dart';
import '../api/account/relationship/pleroma_api_account_relationship_model_impl.dart';
import '../api/account/report/pleroma_api_account_report_model_impl.dart';
import '../api/announcement/emoji_reaction/pleroma_api_announcement_emoji_reaction_model_impl.dart';
import '../api/announcement/pleroma_api_announcement_model_impl.dart';
import '../api/application/client/pleroma_api_client_application_model_impl.dart';
import '../api/application/pleroma_api_application_model_impl.dart';
import '../api/captcha/pleroma_api_captcha_model_impl.dart';
import '../api/card/pleroma_api_card_model_impl.dart';
import '../api/chat/message/pleroma_api_chat_message_model_impl.dart';
import '../api/chat/pleroma_api_chat_model_impl.dart';
import '../api/content/variants/pleroma_api_content_variants_model_impl.dart';
import '../api/conversation/pleroma_api_conversation_model_impl.dart';
import '../api/emoji/custom/pleroma_api_custom_emoji_model_impl.dart';
import '../api/emoji/pleroma_api_emoji_model_impl.dart';
import '../api/feature/pleroma_api_feature_model_impl.dart';
import '../api/featured_tags/pleroma_api_featured_tags_model_impl.dart';
import '../api/field/pleroma_api_field_model_impl.dart';
import '../api/filter/pleroma_api_filter_model_impl.dart';
import '../api/filter/post/pleroma_api_post_filter_model_impl.dart';
import '../api/frontend_configurations/masto_fe/pleroma_api_frontend_configurations_masto_fe_model_impl.dart';
import '../api/frontend_configurations/pleroma_api_frontend_configurations_model_impl.dart';
import '../api/frontend_configurations/pleroma_fe/pleroma_api_frontend_configurations_pleroma_fe_model_impl.dart';
import '../api/frontend_configurations/soapbox_fe/pleroma_api_frontend_configurations_soapbox_fe_model_impl.dart';
import '../api/instance/activity/item/pleroma_api_instance_activity_item_model_impl.dart';
import '../api/instance/federation/mfr/object_age/pleroma_api_instance_federation_mfr_object_age_model_impl.dart';
import '../api/instance/federation/pleroma_api_instance_federation_model_impl.dart';
import '../api/instance/limits/field/pleroma_api_instance_field_limits_model_impl.dart';
import '../api/instance/limits/poll/pleroma_api_instance_poll_limits_model_impl.dart';
import '../api/instance/metadata/pleroma_api_instance_metadata_model_impl.dart';
import '../api/instance/pleroma_api_instance_model_impl.dart';
import '../api/instance/stats/pleroma_api_instance_stats_model_impl.dart';
import '../api/instance/urls/pleroma_api_instance_urls_model_impl.dart';
import '../api/list/pleroma_api_list_model_impl.dart';
import '../api/marker/pleroma_api_marker_model_impl.dart';
import '../api/media/attachment/focus/pleroma_api_media_attachment_focus_model_impl.dart';
import '../api/media/attachment/meta/pleroma_api_media_attachment_meta_model_impl.dart';
import '../api/media/attachment/pleroma_api_media_attachment_model_impl.dart';
import '../api/media/attachment/size/pleroma_api_media_attachment_size_model_impl.dart';
import '../api/mention/pleroma_api_mention_model_impl.dart';
import '../api/notification/pleroma_api_notification_model_impl.dart';
import '../api/oauth/pleroma_api_oauth_model_impl.dart';
import '../api/pagination/pleroma_api_pagination_model_impl.dart';
import '../api/poll/option/pleroma_api_poll_option_model_impl.dart';
import '../api/poll/pleroma_api_poll_model_impl.dart';
import '../api/push/payload/pleroma_api_push_payload_model_impl.dart';
import '../api/push/subscription/alerts/pleroma_api_push_subscription_alerts_model_impl.dart';
import '../api/push/subscription/keys/pleroma_api_push_subscription_keys_model_impl.dart';
import '../api/push/subscription/metadata/pleroma_api_push_subscription_metadata_model_impl.dart';
import '../api/push/subscription/pleroma_api_push_subscription_model_impl.dart';
import '../api/requirement/access/level/pleroma_api_access_level_requirement_model_impl.dart';
import '../api/requirement/access/scopes/pleroma_api_access_scopes_requirement_model_impl.dart';
import '../api/requirement/instance/metadata/version/pleroma_api_instance_metadata_version_requirement_model_impl.dart';
import '../api/search/pleroma_api_search_model_impl.dart';
import '../api/status/context/pleroma_api_status_context_model_impl.dart';
import '../api/status/emoji_reaction/pleroma_api_status_emoji_reaction_model_impl.dart';
import '../api/status/pleroma_api_status_model_impl.dart';
import '../api/status/post/pleroma_api_post_status_model_impl.dart';
import '../api/status/post/poll/pleroma_api_post_status_poll_model_impl.dart';
import '../api/status/post/schedule/pleroma_api_schedule_post_status_model_impl.dart';
import '../api/status/scheduled/params/pleroma_api_scheduled_status_params_model_impl.dart';
import '../api/status/scheduled/pleroma_api_scheduled_status_model_impl.dart';
import '../api/tag/history/item/pleroma_api_tag_history_item_model_impl.dart';
import '../api/tag/pleroma_api_tag_model_impl.dart';
import '../api/version/pleroma_api_version_model_impl.dart';
import '../api/version/range/pleroma_api_version_range_model_impl.dart';
import '../api/web_sockets/channel/pleroma_api_web_sockets_channel_model_impl.dart';
import '../api/web_sockets/event/pleroma_api_web_sockets_event_model_impl.dart';

// ignore_for_file: no-magic-number

abstract class PleromaHiveHelper {
  static NestedTypeRegistryAdapter defaultNestedTypeRegistryAdapter() {
    var createNestedTypeRegistryAdapter =
        Hive.createNestedTypeRegistryAdapter(100);

    registerPleromaAdapters(createNestedTypeRegistryAdapter);

    return createNestedTypeRegistryAdapter;
  }

// ignore: long-method
  static void registerPleromaAdapters(TypeRegistry typeRegistry) {
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        1,
        PleromaApiAccessLevelAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        2,
        PleromaApiAccessScopesAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        3,
        PleromaApiAccessScopesItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        4,
        PleromaApiAccessAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        5,
        PleromaApiAccountIdentityProofAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        6,
        PleromaApiEditMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        7,
        PleromaApiMyAccountNotificationsSettingsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        8,
        PleromaApiMyAccountSourceAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        9,
        PleromaApiMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        10,
        PleromaApiMyAccountPleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        11,
        PleromaApiAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        12,
        PleromaApiAccountPleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        13,
        PleromaApiMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        14,
        PleromaApiAnnouncementEmojiReactionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        15,
        PleromaApiAnnouncementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        17,
        PleromaApiClientApplicationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        18,
        PleromaApiApplicationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        19,
        PleromaApiCaptchaAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        20,
        PleromaApiCardAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        21,
        PleromaApiChatAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        22,
        PleromaApiChatMessageAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        23,
        PleromaApiContentVariantsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        24,
        PleromaApiConversationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        25,
        PleromaApiConversationPleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        26,
        PleromaApiEmojiAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        27,
        PleromaApiCustomEmojiAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        28,
        PleromaApiFeatureAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        29,
        PleromaApiFeaturedTagAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        30,
        PleromaApiFieldAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        31,
        PleromaApiFilterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        32,
        PleromaApiPostFilterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        33,
        PleromaApiFrontendConfigurationsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        34,
        PleromaApiFrontendConfigurationsPleromaFeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        35,
        PleromaApiFrontendConfigurationsMastoFeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        36,
        PleromaApiFrontendConfigurationsSoapboxFeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        37,
        PleromaApiInstanceFederationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        38,
        PleromaApiInstanceFederationMfrObjectAgeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        39,
        PleromaApiInstanceFieldLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        40,
        PleromaApiInstancePollLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        41,
        PleromaApiInstanceMetadataAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        42,
        PleromaApiInstanceStatsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        43,
        PleromaApiInstanceUrlsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        44,
        PleromaApiInstanceAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        45,
        PleromaApiInstancePleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        46,
        PleromaApiListAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        47,
        PleromaApiMarkerAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        48,
        PleromaApiMarkerPleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        49,
        PleromaApiMediaAttachmentAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        50,
        PleromaApiMediaAttachmentPleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        51,
        PleromaApiMediaAttachmentFocusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        52,
        PleromaApiMediaAttachmentMetaAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        53,
        PleromaApiMediaAttachmentSizeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        54,
        PleromaApiMentionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        55,
        PleromaApiNotificationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        56,
        PleromaApiNotificationPleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        57,
        PleromaApiOAuthTokenAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        58,
        PleromaApiPaginationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        59,
        PleromaApiPollAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        60,
        PleromaApiPollOptionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        61,
        PleromaApiPushPayloadAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        62,
        PleromaApiPushSubscriptionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        63,
        PleromaApiPushSubscriptionAlertsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        64,
        PleromaApiPushSubscriptionKeysAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        65,
        PleromaApiPushSubscriptionMetadataAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        66,
        PleromaApiAccessLevelRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        67,
        PleromaApiAccessScopesRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        68,
        PleromaApiInstanceMetadataVersionRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        69,
        PleromaApiSearchResultAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        70,
        PleromaApiStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        71,
        PleromaApiStatusPleromaPartAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        72,
        PleromaApiStatusContextAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        73,
        PleromaApiStatusEmojiReactionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        74,
        PleromaApiPostStatusPollAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        75,
        PleromaApiSchedulePostStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        76,
        PleromaApiPostStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        77,
        PleromaApiScheduledStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        78,
        PleromaApiScheduledStatusParamsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        79,
        PleromaApiTagAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        80,
        PleromaApiTagHistoryItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        81,
        PleromaApiVersionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        82,
        PleromaApiVersionRangeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        83,
        PleromaApiWebSocketsChannelAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        84,
        PleromaApiWebSocketsEventAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        85,
        PleromaApiInstanceActivityItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        86,
        PleromaApiAccountReportAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        87,
        PleromaApiAccountRelationshipAdapter(),
      ),
    );
  }
}
