import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pleroma_api_frontend_configurations_model.dart';

part 'pleroma_api_frontend_configurations_pleroma_fe_model_impl.freezed.dart';

part 'pleroma_api_frontend_configurations_pleroma_fe_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurationsPleromaFe
    with _$PleromaApiFrontendConfigurationsPleromaFe
    implements IPleromaApiFrontendConfigurationsPleromaFe {
  const factory PleromaApiFrontendConfigurationsPleromaFe({
    // @JsonKey(name: 'always_show_subject_input')
    @HiveField(0) required bool? alwaysShowSubjectInput,
    @HiveField(1) required String? background,
    // @JsonKey(name: 'collapse_message_with_subject')
    @HiveField(2) required bool? collapseMessageWithSubject,
    // @JsonKey(name: 'disable_chat')
    @HiveField(3) required bool? disableChat,
    @HiveField(4) required bool? greentext,
    // @JsonKey(name: 'hide_filtered_statuses')
    @HiveField(5) required bool? hideFilteredStatuses,
    // @JsonKey(name: 'hide_muted_posts')
    @HiveField(6) required bool? hideMutedPosts,
    // @JsonKey(name: 'hide_post_stats')
    @HiveField(7) required bool? hidePostStats,
    // @JsonKey(name: 'hide_user_stats')
    @HiveField(8) required bool? hideUserStats,
    // @JsonKey(name: 'login_method')
    @HiveField(9) required String? loginMethod,
    @HiveField(10) required String? logo,
    // @JsonKey(name: 'logo_margin')
    @HiveField(11) required String? logoMargin,
    // @JsonKey(name: 'logo_mask')
    @HiveField(12) required bool? logoMask,
    // @JsonKey(name: 'minimal_scopes_mode')
    @HiveField(13) required bool? minimalScopesMode,
    // @JsonKey(name: 'no_attachment_links')
    @HiveField(14) required bool? noAttachmentLinks,
    // @JsonKey(name: 'nsfw_censor_image')
    @HiveField(15) required String? nsfwCensorImage,
    // @JsonKey(name: 'post_content_type')
    @HiveField(16) required String? postContentType,
    // @JsonKey(name: 'redirect_root_login')
    @HiveField(17) required String? redirectRootLogin,
    // @JsonKey(name: 'redirect_root_no_login')
    @HiveField(18) required String? redirectRootNoLogin,
    // @JsonKey(name: 'scope_copy')
    @HiveField(19) required bool? scopeCopy,
    // @JsonKey(name: 'show_features_panel')
    @HiveField(20) required bool? showFeaturesPanel,
    // @JsonKey(name: 'show_instance_specific_panel')
    @HiveField(21) required bool? showInstanceSpecificPanel,
    // @JsonKey(name: 'sidebar_right')
    @HiveField(22) required bool? sidebarRight,
    // @JsonKey(name: 'subject_line_behavior')
    @HiveField(23) required String? subjectLineBehavior,
    @HiveField(24) required String? theme,
    // @JsonKey(name: 'web_push_notifications')
    @HiveField(25) required bool? webPushNotifications,
  }) = _PleromaApiFrontendConfigurationsPleromaFe;

  factory PleromaApiFrontendConfigurationsPleromaFe.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsPleromaFeFromJson(json);
}

extension PleromaApiFrontendConfigurationsPleromaFeInterfaceExtension
    on IPleromaApiFrontendConfigurationsPleromaFe {
  PleromaApiFrontendConfigurationsPleromaFe
      toPleromaApiFrontendConfigurationsPleromaFe({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiFrontendConfigurationsPleromaFe(
              alwaysShowSubjectInput: alwaysShowSubjectInput,
              background: background,
              collapseMessageWithSubject: collapseMessageWithSubject,
              disableChat: disableChat,
              greentext: greentext,
              hideFilteredStatuses: hideFilteredStatuses,
              hideMutedPosts: hideMutedPosts,
              hidePostStats: hidePostStats,
              hideUserStats: hideUserStats,
              loginMethod: loginMethod,
              logo: logo,
              logoMargin: logoMargin,
              logoMask: logoMask,
              minimalScopesMode: minimalScopesMode,
              noAttachmentLinks: noAttachmentLinks,
              nsfwCensorImage: nsfwCensorImage,
              postContentType: postContentType,
              redirectRootLogin: redirectRootLogin,
              redirectRootNoLogin: redirectRootNoLogin,
              scopeCopy: scopeCopy,
              showFeaturesPanel: showFeaturesPanel,
              showInstanceSpecificPanel: showInstanceSpecificPanel,
              sidebarRight: sidebarRight,
              subjectLineBehavior: subjectLineBehavior,
              theme: theme,
              webPushNotifications: webPushNotifications,
            ),
            forceNewObject: forceNewObject,
          );
}
