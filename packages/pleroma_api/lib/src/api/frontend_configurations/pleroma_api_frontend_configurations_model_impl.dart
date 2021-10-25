import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_frontend_configurations_model.dart';

part 'pleroma_api_frontend_configurations_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_frontend_configurations_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurations
    with _$PleromaApiFrontendConfigurations
    implements IPleromaApiFrontendConfigurations {
  const factory PleromaApiFrontendConfigurations({
    @JsonKey(name: 'masto_fe')
    @HiveField(0)
        required PleromaApiFrontendConfigurationsMastoFe? mastoFe,
    @JsonKey(name: 'pleroma_fe')
    @HiveField(1)
        required PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
    @JsonKey(name: 'soapbox_fe')
    @HiveField(2)
        required PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe,
  }) = _PleromaApiFrontendConfigurations;

  factory PleromaApiFrontendConfigurations.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurationsMastoFe
    with _$PleromaApiFrontendConfigurationsMastoFe
    implements IPleromaApiFrontendConfigurationsMastoFe {
  const factory PleromaApiFrontendConfigurationsMastoFe({
    @HiveField(0) required bool? showInstanceSpecificPanel,
  }) = _PleromaApiFrontendConfigurationsMastoFe;

  factory PleromaApiFrontendConfigurationsMastoFe.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsMastoFeFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurationsPleromaFe
    with _$PleromaApiFrontendConfigurationsPleromaFe
    implements IPleromaApiFrontendConfigurationsPleromaFe {
  const factory PleromaApiFrontendConfigurationsPleromaFe({
    @HiveField(0) required bool? alwaysShowSubjectInput,
    @HiveField(1) required String? background,
    @HiveField(2) required bool? collapseMessageWithSubject,
    @HiveField(3) required bool? disableChat,
    @HiveField(4) required bool? greentext,
    @HiveField(5) required bool? hideFilteredStatuses,
    @HiveField(6) required bool? hideMutedPosts,
    @HiveField(7) required bool? hidePostStats,
    @HiveField(8) required bool? hideUserStats,
    @HiveField(9) required String? loginMethod,
    @HiveField(10) required String? logo,
    @HiveField(11) required String? logoMargin,
    @HiveField(12) required bool? logoMask,
    @HiveField(13) required bool? minimalScopesMode,
    @HiveField(14) required bool? noAttachmentLinks,
    @HiveField(15) required String? nsfwCensorImage,
    @HiveField(16) required String? postContentType,
    @HiveField(17) required String? redirectRootLogin,
    @HiveField(18) required String? redirectRootNoLogin,
    @HiveField(19) required bool? scopeCopy,
    @HiveField(20) required bool? showFeaturesPanel,
    @HiveField(21) required bool? showInstanceSpecificPanel,
    @HiveField(22) required bool? sidebarRight,
    @HiveField(23) required String? subjectLineBehavior,
    @HiveField(24) required String? theme,
    @HiveField(25) required bool? webPushNotifications,
  }) = _PleromaApiFrontendConfigurationsPleromaFe;

  factory PleromaApiFrontendConfigurationsPleromaFe.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsPleromaFeFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurationsSoapboxFe
    with _$PleromaApiFrontendConfigurationsSoapboxFe
    implements IPleromaApiFrontendConfigurationsSoapboxFe {
  const factory PleromaApiFrontendConfigurationsSoapboxFe({
    @HiveField(0) required String? brandColor,
  }) = _PleromaApiFrontendConfigurationsSoapboxFe;

  factory PleromaApiFrontendConfigurationsSoapboxFe.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsSoapboxFeFromJson(json);
}

extension PleromaApiFrontendConfigurationsInterfaceExtension
    on IPleromaApiFrontendConfigurations {
  PleromaApiFrontendConfigurations toPleromaApiFrontendConfigurations({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiFrontendConfigurations(
          mastoFe: mastoFe?.toPleromaApiFrontendConfigurationsMastoFe(),
          pleromaFe: pleromaFe?.toPleromaApiFrontendConfigurationsPleromaFe(),
          soapboxFe: soapboxFe?.toPleromaApiFrontendConfigurationsSoapboxFe(),
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiFrontendConfigurationsMastoFeInterfaceExtension
    on IPleromaApiFrontendConfigurationsMastoFe {
  PleromaApiFrontendConfigurationsMastoFe
      toPleromaApiFrontendConfigurationsMastoFe({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiFrontendConfigurationsMastoFe(
              showInstanceSpecificPanel: showInstanceSpecificPanel,
            ),
            forceNewObject: forceNewObject,
          );
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

extension PleromaApiFrontendConfigurationsSoapboxFeInterfaceExtension
    on IPleromaApiFrontendConfigurationsSoapboxFe {
  PleromaApiFrontendConfigurationsSoapboxFe
      toPleromaApiFrontendConfigurationsSoapboxFe({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiFrontendConfigurationsSoapboxFe(
              brandColor: brandColor,
            ),
            forceNewObject: forceNewObject,
          );
}
