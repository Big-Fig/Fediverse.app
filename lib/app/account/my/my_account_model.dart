import 'package:fedi/app/account/account_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'my_account_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'my_account_model.g.dart';

abstract class IMyAccount extends IAccount implements IJsonObj {
  int? get followRequestsCount;

  bool? get discoverable;

  Map<String, dynamic>? get settingsStore;

  int? get unreadConversationCount;

  int? get unreadNotificationsCount;

  String? get chatToken;

  IUnifediApiMyAccountNotificationsSettings? get notificationSettings;

  bool? get showRole;

  bool? get noRichText;

  String? get actorType;

  String? get privacy;

  bool? get sensitive;

  String? get language;

  @override
  // TODO: remove old code
  // ignore: long-parameter-list
  IMyAccount copyWithTemp({
    int? id,
    String? remoteId,
    String? username,
    String? url,
    String? note,
    bool? locked,
    String? headerStatic,
    String? header,
    int? followingCount,
    int? followersCount,
    int? statusesCount,
    String? displayName,
    DateTime? createdAt,
    bool? bot,
    String? avatarStatic,
    String? avatar,
    String? acct,
    DateTime? lastStatusAt,
    List<UnifediApiField>? fields,
    List<UnifediApiEmoji>? emojis,
    List<UnifediApiTag>? tags,
    IUnifediApiAccountRelationship? relationship,
    bool? isAdmin,
    bool? isModerator,
    bool? confirmationPending,
    bool? hideFavorites,
    bool? hideFollowers,
    bool? hideFollows,
    bool? hideFollowersCount,
    bool? hideFollowsCount,
    int? followRequestsCount,
    bool? deactivated,
    bool? allowFollowingMove,
    bool? skipThreadContainment,
    String? backgroundImage,
    bool? acceptsChatMessages,
    IUnifediApiMyAccountNotificationsSettings? notificationSettings,
  });
}

extension IMyAccountPleromaExtension on IMyAccount {
  UnifediApiMyAccount toUnifediApiMyAccount() {
    if (this is UnifediApiMyAccountWrapper) {
      return (this as UnifediApiMyAccountWrapper).unifediApiAccount;
    } else {
      return UnifediApiMyAccount(
        muteExpiresAt: muteExpiresAt,
        acceptsChatMessages: acceptsChatMessages,
        actorType: actorType,
        language: language,
        notificationSettings:
            notificationSettings?.toUnifediApiMyAccountNotificationsSettings(),
        privacy: privacy,
        sensitive: sensitive,
        settingsStore: settingsStore,
        allowFollowingMove: allowFollowingMove,
        alsoKnownAs: alsoKnownAs,
        apId: apId,
        backgroundImage: backgroundImage,
        chatToken: chatToken,
        confirmationPending: confirmationPending,
        deactivated: deactivated,
        favicon: favicon,
        hideFavorites: hideFavorites,
        hideFollows: hideFollows,
        hideFollowsCount: hideFollowsCount,
        hideFollowers: hideFollowers,
        hideFollowersCount: hideFollowersCount,
        isAdmin: isAdmin,
        isConfirmed: isConfirmed,
        isModerator: isModerator,
        noRichText: noRichText,
        relationship: relationship?.toUnifediApiAccountRelationship(),
        showRole: showRole,
        skipThreadContainment: skipThreadContainment,
        tags: tags?.toUnifediApiTagList(),
        unreadConversationCount: unreadConversationCount,
        unreadNotificationsCount: unreadNotificationsCount,
        suspended: suspended,
        header: header,
        headerStatic: headerStatic,
        username: username,
        url: url,
        statusesCount: statusesCount,
        note: note,
        locked: locked,
        id: remoteId,
        followingCount: followingCount,
        followersCount: followersCount,
        fields: fields?.toUnifediApiFieldList(),
        emojis: emojis?.toUnifediApiEmojiList(),
        displayName: displayName,
        createdAt: createdAt,
        bot: bot,
        avatarStatic: avatarStatic,
        avatar: avatar,
        acct: acct,
        lastStatusAt: lastStatusAt,
        discoverable: discoverable,
        followRequestsCount: followRequestsCount,
        fqn: fqn,
      );
    }
  }
}

extension IMyAccountExtension on IMyAccount {
  UnifediApiMyAccountWrapper toUnifediApiMyAccountWrapper() {
    if (this is UnifediApiMyAccountWrapper) {
      return this as UnifediApiMyAccountWrapper;
    } else {
      return UnifediApiMyAccountWrapper(
        unifediApiAccount: toUnifediApiMyAccount(),
      );
    }
  }
}

@HiveType(typeId: -32 + 114)
@freezed
class UnifediApiMyAccountWrapper
    with _$UnifediApiMyAccountWrapper
    implements IMyAccount {
  const UnifediApiMyAccountWrapper._();

  const factory UnifediApiMyAccountWrapper({
    @HiveField(0)
    @JsonKey(name: 'remote_account')
        required UnifediApiMyAccount unifediApiAccount,
  }) = _UnifediApiMyAccountWrapper;

  @override
  bool? get discoverable => unifediApiAccount.discoverable;

  @override
  String get acct => unifediApiAccount.acct;

  @override
  String get avatar => unifediApiAccount.avatar;

  @override
  String get avatarStatic => unifediApiAccount.avatarStatic;

  @override
  bool? get bot => unifediApiAccount.bot;

  @override
  DateTime get createdAt => unifediApiAccount.createdAt;

  @override
  String? get displayName => unifediApiAccount.displayName;

  @override
  List<IUnifediApiEmoji>? get emojis => unifediApiAccount.emojis;

  @override
  List<IUnifediApiField>? get fields => unifediApiAccount.fields;

  @override
  int? get followersCount => unifediApiAccount.followersCount;

  @override
  int? get followingCount => unifediApiAccount.followingCount;

  @override
  String? get header => unifediApiAccount.header;

  @override
  String? get headerStatic => unifediApiAccount.headerStatic;

  @override
  DateTime? get lastStatusAt => unifediApiAccount.lastStatusAt;

  @override
  int? get localId => null;

  @override
  bool? get locked => unifediApiAccount.locked;

  @override
  String? get note => unifediApiAccount.note;

  @override
  bool? get allowFollowingMove => unifediApiAccount.allowFollowingMove;

  @override
  bool? get confirmationPending => unifediApiAccount.confirmationPending;

  @override
  bool? get deactivated => unifediApiAccount.deactivated;

  @override
  bool? get hideFavorites => unifediApiAccount.hideFavorites;

  @override
  bool? get hideFollowers => unifediApiAccount.hideFollowers;

  @override
  bool? get hideFollowersCount => unifediApiAccount.hideFollowersCount;

  @override
  bool? get hideFollows => unifediApiAccount.hideFollows;

  @override
  bool? get hideFollowsCount => unifediApiAccount.hideFollowsCount;

  @override
  bool? get isAdmin => unifediApiAccount.isAdmin;

  @override
  bool? get isModerator => unifediApiAccount.isModerator;

  @override
  UnifediApiAccountRelationship? get relationship =>
      unifediApiAccount.relationship;

  @override
  bool? get skipThreadContainment => unifediApiAccount.skipThreadContainment;

  @override
  List<UnifediApiTag>? get tags => unifediApiAccount.tags;

  @override
  String get remoteId => unifediApiAccount.id;

  @override
  int? get statusesCount => unifediApiAccount.statusesCount;

  @override
  String get url => unifediApiAccount.url;

  @override
  String get username => unifediApiAccount.username;

  @override
  int? get followRequestsCount => unifediApiAccount.followRequestsCount;

  @override
  String? get fqn => unifediApiAccount.fqn;

  @override
  String? get chatToken => unifediApiAccount.chatToken;

  @override
  UnifediApiMyAccountNotificationsSettings? get notificationSettings =>
      unifediApiAccount.notificationSettings;

  @override
  Map<String, dynamic>? get settingsStore => unifediApiAccount.settingsStore;

  @override
  int? get unreadConversationCount => unifediApiAccount.unreadConversationCount;

  @override
  int? get unreadNotificationsCount =>
      unifediApiAccount.unreadNotificationsCount;

  @override
  bool? get acceptsChatMessages => unifediApiAccount.acceptsChatMessages;

  @override
  List<String>? get alsoKnownAs => unifediApiAccount.alsoKnownAs;

  @override
  String? get apId => unifediApiAccount.apId;

  @override
  String? get favicon => unifediApiAccount.favicon;

  @override
  bool? get isConfirmed => unifediApiAccount.isConfirmed;

  @override
  String? get backgroundImage => unifediApiAccount.backgroundImage;

  factory UnifediApiMyAccountWrapper.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiMyAccountWrapperFromJson(json);

  @override
  String? get actorType => unifediApiAccount.actorType;

  @override
  String? get language => unifediApiAccount.language;

  @override
  DateTime? get muteExpiresAt => unifediApiAccount.muteExpiresAt;

  @override
  bool? get noRichText => unifediApiAccount.noRichText;

  @override
  String? get privacy => unifediApiAccount.privacy;

  @override
  bool? get sensitive => unifediApiAccount.sensitive;

  @override
  bool? get showRole => unifediApiAccount.showRole;

  @override
  bool? get suspended => unifediApiAccount.suspended;

  @override
  // ignore: long-parameter-list, long-method
  IMyAccount copyWithTemp({
    int? id,
    String? remoteId,
    String? username,
    String? url,
    String? note,
    bool? locked,
    String? headerStatic,
    String? header,
    int? followingCount,
    int? followersCount,
    int? statusesCount,
    String? displayName,
    DateTime? createdAt,
    bool? bot,
    String? avatarStatic,
    String? avatar,
    String? acct,
    DateTime? lastStatusAt,
    List<UnifediApiField>? fields,
    List<UnifediApiEmoji>? emojis,
    List<UnifediApiTag>? tags,
    IUnifediApiAccountRelationship? relationship,
    bool? isAdmin,
    bool? isModerator,
    bool? confirmationPending,
    bool? hideFavorites,
    bool? hideFollowers,
    bool? hideFollows,
    bool? hideFollowersCount,
    bool? hideFollowsCount,
    int? followRequestsCount,
    bool? deactivated,
    bool? allowFollowingMove,
    bool? skipThreadContainment,
    String? backgroundImage,
    bool? acceptsChatMessages,
    IUnifediApiMyAccountNotificationsSettings? notificationSettings,
  }) =>
      UnifediApiMyAccountWrapper(
        unifediApiAccount: UnifediApiMyAccount(
          header: header ?? unifediApiAccount.header,
          headerStatic: headerStatic ?? unifediApiAccount.headerStatic,
          username: username ?? unifediApiAccount.username,
          url: url ?? unifediApiAccount.url,
          statusesCount: statusesCount ?? unifediApiAccount.statusesCount,
          note: note ?? unifediApiAccount.note,
          locked: locked ?? unifediApiAccount.locked,
          id: remoteId ?? unifediApiAccount.id,
          followingCount: followingCount ?? unifediApiAccount.followingCount,
          followersCount: followersCount ?? unifediApiAccount.followersCount,
          fields: fields ?? unifediApiAccount.fields?.toUnifediApiFieldList(),
          emojis: emojis ?? unifediApiAccount.emojis?.toUnifediApiEmojiList(),
          displayName: displayName ?? unifediApiAccount.displayName,
          createdAt: createdAt ?? unifediApiAccount.createdAt,
          bot: bot ?? unifediApiAccount.bot,
          avatarStatic: avatarStatic ?? unifediApiAccount.avatarStatic,
          avatar: avatar ?? unifediApiAccount.avatar,
          acct: acct ?? unifediApiAccount.acct,
          suspended: suspended ?? unifediApiAccount.suspended,
          muteExpiresAt: muteExpiresAt ?? unifediApiAccount.muteExpiresAt,
          lastStatusAt: lastStatusAt ?? unifediApiAccount.lastStatusAt,
          discoverable: discoverable ?? unifediApiAccount.discoverable,
          followRequestsCount:
              followRequestsCount ?? unifediApiAccount.followRequestsCount,
          fqn: fqn ?? unifediApiAccount.fqn,
          backgroundImage: backgroundImage ?? unifediApiAccount.backgroundImage,
          tags: tags ?? unifediApiAccount.tags?.toUnifediApiTagList(),
          relationship: (relationship ?? unifediApiAccount.relationship)
              ?.toUnifediApiAccountRelationship(),
          isAdmin: isAdmin ?? unifediApiAccount.isAdmin,
          isModerator: isModerator ?? unifediApiAccount.isModerator,
          confirmationPending:
              confirmationPending ?? unifediApiAccount.confirmationPending,
          hideFavorites: hideFavorites ?? unifediApiAccount.hideFavorites,
          hideFollowers: hideFollowers ?? unifediApiAccount.hideFollowers,
          hideFollows: hideFollows ?? unifediApiAccount.hideFollows,
          hideFollowersCount:
              hideFollowersCount ?? unifediApiAccount.hideFollowersCount,
          hideFollowsCount:
              hideFollowsCount ?? unifediApiAccount.hideFollowsCount,
          settingsStore: settingsStore ?? unifediApiAccount.settingsStore,
          chatToken: chatToken ?? unifediApiAccount.chatToken,
          deactivated: deactivated ?? unifediApiAccount.deactivated,
          allowFollowingMove:
              allowFollowingMove ?? unifediApiAccount.allowFollowingMove,
          unreadConversationCount: unreadConversationCount ??
              unifediApiAccount.unreadConversationCount,
          skipThreadContainment:
              skipThreadContainment ?? unifediApiAccount.skipThreadContainment,
          notificationSettings:
              (notificationSettings ?? unifediApiAccount.notificationSettings)
                  ?.toUnifediApiMyAccountNotificationsSettings(),
          acceptsChatMessages:
              acceptsChatMessages ?? unifediApiAccount.acceptsChatMessages,
          isConfirmed: isConfirmed ?? unifediApiAccount.isConfirmed,
          favicon: favicon ?? unifediApiAccount.favicon,
          apId: apId ?? unifediApiAccount.apId,
          alsoKnownAs: alsoKnownAs ?? unifediApiAccount.alsoKnownAs,
          unreadNotificationsCount: unreadNotificationsCount ??
              unifediApiAccount.unreadNotificationsCount,
          noRichText: noRichText ?? unifediApiAccount.noRichText,
          actorType: actorType ?? unifediApiAccount.actorType,
          showRole: showRole ?? unifediApiAccount.showRole,
          language: language ?? unifediApiAccount.language,
          privacy: privacy ?? unifediApiAccount.privacy,
          sensitive: sensitive ?? unifediApiAccount.sensitive,
        ),
      );
}

class SelfActionNotPossibleException implements Exception {
  const SelfActionNotPossibleException();

  @override
  String toString() {
    return 'SelfActionNotPossibleException: '
        'You cant retrieve or perform actions with yourself';
  }
}
