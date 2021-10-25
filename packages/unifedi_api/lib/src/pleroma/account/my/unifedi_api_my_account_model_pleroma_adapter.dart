import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/my/notifications_settings/unifedi_api_my_account_notifications_settings_model.dart';
import '../../../api/account/my/unifedi_api_my_account_model.dart';
import '../../../api/account/relationship/unifedi_api_account_relationship_model.dart';
import '../../../api/emoji/unifedi_api_emoji_model.dart';
import '../../../api/field/unifedi_api_field_model.dart';
import '../../../api/tag/unifedi_api_tag_model.dart';
import '../../emoji/unifedi_api_emoji_model_pleroma_adapter.dart';
import '../../field/unifedi_api_field_model_pleroma_adapter.dart';
import '../../tag/unifedi_api_tag_model_pleroma_adapter.dart';
import '../relationship/unifedi_api_account_relationship_model_pleroma_adapter.dart';
import 'notifications_settings/unifedi_api_my_account_notifications_settings_model_pleroma_adapter.dart';

part 'unifedi_api_my_account_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_my_account_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMyAccountPleromaAdapter
    with _$UnifediApiMyAccountPleromaAdapter
    implements IUnifediApiMyAccount {
  const UnifediApiMyAccountPleromaAdapter._();

  const factory UnifediApiMyAccountPleromaAdapter(
    @HiveField(0) PleromaApiMyAccount value,
  ) = _UnifediApiMyAccountPleromaAdapter;

  @override
  bool? get acceptsChatMessages => value.pleroma?.acceptsChatMessages;

  @override
  String get acct => value.acct;

  @override
  bool? get allowFollowingMove => value.pleroma?.allowFollowingMove;

  @override
  List<String>? get alsoKnownAs => value.pleroma?.alsoKnownAs;

  @override
  String? get apId => value.pleroma?.apId;

  @override
  String get avatar => value.avatar;

  @override
  String get avatarStatic => value.avatarStatic;

  @override
  String? get backgroundImage => value.pleroma?.backgroundImage;

  @override
  bool? get bot => value.bot;

  @override
  bool? get confirmationPending => value.pleroma?.confirmationPending;

  @override
  DateTime get createdAt => value.createdAt;

  @override
  bool? get deactivated => value.pleroma?.deactivated;

  @override
  String? get displayName => value.displayName;

  @override
  List<IUnifediApiEmoji>? get emojis =>
      value.emojis?.toUnifediApiEmojiPleromaAdapterList();

  @override
  String? get favicon => value.pleroma?.favicon;

  @override
  List<IUnifediApiField>? get fields =>
      value.fields?.toUnifediApiFieldPleromaAdapterList();

  @override
  int? get followersCount => value.followersCount;

  @override
  int? get followingCount => value.followingCount;

  @override
  String? get fqn => value.fqn;

  @override
  String? get header => value.header;

  @override
  String? get headerStatic => value.headerStatic;

  @override
  bool? get hideFavorites => value.pleroma?.hideFavorites;

  @override
  bool? get hideFollowers => value.pleroma?.hideFollowers;

  @override
  bool? get hideFollowersCount => value.pleroma?.hideFollowersCount;

  @override
  bool? get hideFollows => value.pleroma?.hideFollows;

  @override
  bool? get hideFollowsCount => value.pleroma?.hideFollowsCount;

  @override
  String get id => value.id;

  @override
  bool? get isAdmin => value.pleroma?.isAdmin;

  @override
  bool? get isConfirmed => value.pleroma?.isConfirmed;

  @override
  bool? get isModerator => value.pleroma?.isModerator;

  @override
  DateTime? get lastStatusAt => value.lastStatusAt;

  @override
  bool? get locked => value.locked;

  @override
  String? get note => value.note;

  @override
  IUnifediApiAccountRelationship? get relationship =>
      value.pleroma?.relationship
          ?.toUnifediApiAccountRelationshipPleromaAdapter();

  @override
  bool? get skipThreadContainment => value.pleroma?.skipThreadContainment;

  @override
  int? get statusesCount => value.statusesCount;

  @override
  List<IUnifediApiTag>? get tags =>
      value.pleroma?.tags?.toUnifediApiTagPleromaAdapterList();

  @override
  String get url => value.url;

  @override
  String get username => value.username;

  @override
  String? get actorType => value.source?.pleroma?.actorType;

  @override
  String? get chatToken => value.pleroma?.chatToken;

  @override
  bool? get discoverable =>
      value.discoverable ?? value.source?.pleroma?.discoverable;

  @override
  int? get followRequestsCount =>
      value.followRequestsCount ?? value.source?.followRequestsCount;

  @override
  bool? get noRichText => value.source?.pleroma?.noRichText;

  @override
  IUnifediApiMyAccountNotificationsSettings? get notificationSettings =>
      value.pleroma?.notificationSettings
          ?.toUnifediApiMyAccountNotificationSettingsPleromaAdapter();

  @override
  Map<String, dynamic>? get settingsStore => value.pleroma?.settingsStore;

  @override
  bool? get showRole => value.source?.pleroma?.showRole;

  @override
  int? get unreadConversationCount => value.pleroma?.unreadConversationCount;

  @override
  int? get unreadNotificationsCount => value.pleroma?.unreadNotificationsCount;

  @override
  bool? get suspended => value.suspended;

  @override
  DateTime? get muteExpiresAt => value.muteExpiresAt;

  @override
  String? get language => value.source?.language;

  @override
  String? get privacy => value.source?.privacy;

  @override
  bool? get sensitive => value.source?.sensitive;

  factory UnifediApiMyAccountPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMyAccountPleromaAdapterFromJson(json);
}

extension PleromaApiMyAccountUnifediExtension on IPleromaApiMyAccount {
  UnifediApiMyAccountPleromaAdapter toUnifediApiMyAccountPleromaAdapter() =>
      UnifediApiMyAccountPleromaAdapter(
        toPleromaApiMyAccount(),
      );
}

extension PleromaApiMyAccountUnifediListExtension
    on List<IPleromaApiMyAccount> {
  List<UnifediApiMyAccountPleromaAdapter>
      toUnifediApiMyAccountPleromaAdapterList() => map(
            (item) => item.toUnifediApiMyAccountPleromaAdapter(),
          ).toList();
}

extension UnifediApiMyAccountPleromaExtension on IUnifediApiMyAccount {
  // ignore: long-method
  PleromaApiMyAccount toPleromaApiMyAccount() => PleromaApiMyAccount(
        username: username,
        url: url,
        // ignore:avoid-non-null-assertion
        statusesCount: statusesCount!,
        note: note,
        // ignore:avoid-non-null-assertion
        locked: locked!,
        id: id,
        // ignore:avoid-non-null-assertion
        // ignore:avoid-non-null-assertion
        headerStatic: headerStatic!,
        // ignore:avoid-non-null-assertion
        header: header!,
        // ignore:avoid-non-null-assertion
        followingCount: followingCount!,
        // ignore:avoid-non-null-assertion
        followersCount: followersCount!,
        fields: fields?.toPleromaApiFieldList(),
        emojis: emojis?.toPleromaApiEmojiList(),
        displayName: displayName,
        createdAt: createdAt,
        bot: bot,
        avatarStatic: avatarStatic,
        avatar: avatar,
        acct: acct,
        pleroma: PleromaApiMyAccountPleromaPart(
          backgroundImage: backgroundImage,
          tags: tags?.toPleromaApiTagList(),
          relationship: relationship?.toPleromaApiAccountRelationship(),
          isAdmin: isAdmin,
          isModerator: isModerator,
          confirmationPending: confirmationPending,
          hideFavorites: hideFavorites,
          hideFollowers: hideFollowers,
          hideFollows: hideFollows,
          hideFollowersCount: hideFollowersCount,
          hideFollowsCount: hideFollowsCount,
          deactivated: deactivated,
          allowFollowingMove: allowFollowingMove,
          skipThreadContainment: skipThreadContainment,
          acceptsChatMessages: acceptsChatMessages,
          isConfirmed: isConfirmed,
          favicon: favicon,
          apId: apId,
          alsoKnownAs: alsoKnownAs,
          settingsStore: settingsStore,
          chatToken: chatToken,
          unreadNotificationsCount: unreadNotificationsCount,
          unreadConversationCount: unreadConversationCount,
          notificationSettings: notificationSettings
              ?.toPleromaApiMyAccountNotificationsSettings(),
        ),
        source: PleromaApiMyAccountSource(
          privacy: privacy,
          sensitive: sensitive,
          language: language,
          note: note,
          fields: fields?.toPleromaApiFieldList(),
          followRequestsCount: followRequestsCount,
          pleroma: PleromaApiMyAccountSourcePleromaPart(
            showRole: showRole,
            noRichText: noRichText,
            discoverable: discoverable,
            actorType: actorType,
          ),
        ),
        discoverable: discoverable,
        lastStatusAt: lastStatusAt,
        fqn: fqn,
        suspended: suspended,
        muteExpiresAt: muteExpiresAt,
        followRequestsCount: followRequestsCount,
      );
}
