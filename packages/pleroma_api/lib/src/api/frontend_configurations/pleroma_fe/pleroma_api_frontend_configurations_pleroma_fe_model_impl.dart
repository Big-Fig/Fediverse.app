import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_frontend_configurations_pleroma_fe_model.dart';

part 'pleroma_api_frontend_configurations_pleroma_fe_model_impl.freezed.dart';

part 'pleroma_api_frontend_configurations_pleroma_fe_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurationsPleromaFe
    with _$PleromaApiFrontendConfigurationsPleromaFe
    implements IPleromaApiFrontendConfigurationsPleromaFe {
  const factory PleromaApiFrontendConfigurationsPleromaFe({
    @JsonKey(name: 'alwaysShowSubjectInput')
    @HiveField(0)
        required bool? alwaysShowSubjectInput,
    @HiveField(1) required String? background,
    @JsonKey(name: 'collapseMessageWithSubject')
    @HiveField(2)
        required bool? collapseMessageWithSubject,
    @JsonKey(name: 'disableChat') @HiveField(3) required bool? disableChat,
    @HiveField(4) required bool? greentext,
    @JsonKey(name: 'hideFilteredStatuses')
    @HiveField(5)
        required bool? hideFilteredStatuses,
    @JsonKey(name: 'hideMutedPosts')
    @HiveField(6)
        required bool? hideMutedPosts,
    @JsonKey(name: 'hidePostStats') @HiveField(7) required bool? hidePostStats,
    @JsonKey(name: 'hideUserStats') @HiveField(8) required bool? hideUserStats,
    @JsonKey(name: 'loginMethod') @HiveField(9) required String? loginMethod,
    @HiveField(10) required String? logo,
    @JsonKey(name: 'logoMargin') @HiveField(11) required String? logoMargin,
    @JsonKey(name: 'logoMask') @HiveField(12) required bool? logoMask,
    @JsonKey(name: 'minimalScopesMode')
    @HiveField(13)
        required bool? minimalScopesMode,
    @JsonKey(name: 'noAttachmentLinks')
    @HiveField(14)
        required bool? noAttachmentLinks,
    @JsonKey(name: 'nsfwCensorImage')
    @HiveField(15)
        required String? nsfwCensorImage,
    @JsonKey(name: 'postContentType')
    @HiveField(16)
        required String? postContentType,
    @JsonKey(name: 'redirectRootLogin')
    @HiveField(17)
        required String? redirectRootLogin,
    @JsonKey(name: 'redirectRootNoLogin')
    @HiveField(18)
        required String? redirectRootNoLogin,
    @JsonKey(name: 'scopeCopy') @HiveField(19) required bool? scopeCopy,
    @JsonKey(name: 'showFeaturesPanel')
    @HiveField(20)
        required bool? showFeaturesPanel,
    @JsonKey(name: 'showInstanceSpecificPanel')
    @HiveField(21)
        required bool? showInstanceSpecificPanel,
    @JsonKey(name: 'sidebarRight') @HiveField(22) required bool? sidebarRight,
    @JsonKey(name: 'subjectLineBehavior')
    @HiveField(23)
        required String? subjectLineBehavior,
    @HiveField(24) required String? theme,
    @JsonKey(name: 'webPushNotifications')
    @HiveField(25)
        required bool? webPushNotifications,
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
