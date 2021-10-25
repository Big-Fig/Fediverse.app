import '../../pleroma_api_model.dart';

abstract class IPleromaApiFrontendConfigurationsPleromaFe
    implements IPleromaApiResponsePart {
  bool? get alwaysShowSubjectInput;

  String? get background;

  bool? get collapseMessageWithSubject;

  bool? get disableChat;

  bool? get greentext;

  bool? get hideFilteredStatuses;

  bool? get hideMutedPosts;

  bool? get hidePostStats;

  bool? get hideUserStats;

  String? get loginMethod;

  String? get logo;

  String? get logoMargin;

  bool? get logoMask;

  bool? get minimalScopesMode;

  bool? get noAttachmentLinks;

  String? get nsfwCensorImage;

  String? get postContentType;

  String? get redirectRootLogin;

  String? get redirectRootNoLogin;

  bool? get scopeCopy;

  bool? get showFeaturesPanel;

  bool? get showInstanceSpecificPanel;

  bool? get sidebarRight;

  String? get subjectLineBehavior;

  String? get theme;

  bool? get webPushNotifications;
}
