import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/account/my/notifications_settings/unifedi_api_my_account_notifications_settings_model.dart';
import '../../../api/account/my/unifedi_api_my_account_model.dart';
import '../../../api/account/relationship/unifedi_api_account_relationship_model.dart';
import '../../../api/emoji/unifedi_api_emoji_model.dart';
import '../../../api/field/unifedi_api_field_model.dart';
import '../../../api/tag/unifedi_api_tag_model.dart';
import '../../emoji/unifedi_api_emoji_model_mastodon_adapter.dart';
import '../../field/unifedi_api_field_model_mastodon_adapter.dart';

part 'unifedi_api_my_account_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_my_account_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMyAccountMastodonAdapter
    with _$UnifediApiMyAccountMastodonAdapter
    implements IUnifediApiMyAccount {
  const UnifediApiMyAccountMastodonAdapter._();

  const factory UnifediApiMyAccountMastodonAdapter(
    @HiveField(0) MastodonApiMyAccount value,
  ) = _UnifediApiMyAccountMastodonAdapter;

  @override
  bool? get acceptsChatMessages => null;

  @override
  String get acct => value.acct;

  @override
  bool? get allowFollowingMove => null;

  @override
  List<String>? get alsoKnownAs => null;

  @override
  String? get apId => null;

  @override
  String get avatar => value.avatar;

  @override
  String get avatarStatic => value.avatarStatic;

  @override
  String? get backgroundImage => null;

  @override
  bool? get bot => value.bot;

  @override
  bool? get confirmationPending => null;

  @override
  DateTime get createdAt => value.createdAt;

  @override
  bool? get deactivated => null;

  @override
  String? get displayName => value.displayName;

  @override
  List<IUnifediApiEmoji>? get emojis =>
      value.emojis?.toUnifediApiEmojiMastodonAdapterList();

  @override
  String? get favicon => null;

  @override
  List<IUnifediApiField>? get fields =>
      value.fields?.toUnifediApiFieldMastodonAdapterList();

  @override
  int? get followersCount => value.followersCount;

  @override
  int? get followingCount => value.followingCount;

  @override
  String? get fqn => null;

  @override
  String? get header => value.header;

  @override
  String? get headerStatic => value.headerStatic;

  @override
  bool? get hideFavorites => null;

  @override
  bool? get hideFollowers => null;

  @override
  bool? get hideFollowersCount => null;

  @override
  bool? get hideFollows => null;

  @override
  bool? get hideFollowsCount => null;

  @override
  String get id => value.id;

  @override
  bool? get isAdmin => null;

  @override
  bool? get isConfirmed => null;

  @override
  bool? get isModerator => null;

  @override
  DateTime? get lastStatusAt => value.lastStatusAt;

  @override
  bool? get locked => value.locked;

  @override
  String? get note => value.note;

  @override
  IUnifediApiAccountRelationship? get relationship => null;

  @override
  bool? get skipThreadContainment => null;

  @override
  int? get statusesCount => value.statusesCount;

  @override
  List<IUnifediApiTag>? get tags => null;

  @override
  String get url => value.url;

  @override
  String get username => value.username;

  @override
  String? get actorType => null;

  @override
  String? get chatToken => null;

  @override
  bool? get discoverable => value.discoverable;

  @override
  int? get followRequestsCount => value.source?.followRequestsCount;

  @override
  bool? get noRichText => null;

  @override
  IUnifediApiMyAccountNotificationsSettings? get notificationSettings => null;

  @override
  Map<String, dynamic>? get settingsStore => null;

  @override
  bool? get showRole => null;

  @override
  int? get unreadConversationCount => null;

  @override
  int? get unreadNotificationsCount => null;

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

  factory UnifediApiMyAccountMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMyAccountMastodonAdapterFromJson(json);
}

extension MastodonApiMyAccountUnifediExtension on IMastodonApiMyAccount {
  UnifediApiMyAccountMastodonAdapter toUnifediApiMyAccountMastodonAdapter() =>
      UnifediApiMyAccountMastodonAdapter(
        toMastodonApiMyAccount(),
      );
}

extension MastodonApiMyAccountUnifediListExtension
    on List<IMastodonApiMyAccount> {
  List<UnifediApiMyAccountMastodonAdapter>
      toUnifediApiMyAccountMastodonAdapterList() => map(
            (item) => item.toUnifediApiMyAccountMastodonAdapter(),
          ).toList();
}

extension UnifediApiMyAccountMastodonExtension on IUnifediApiMyAccount {
  MastodonApiMyAccount toMastodonApiMyAccount() => MastodonApiMyAccount(
        username: username,
        url: url,
        // ignore:avoid-non-null-assertion
        statusesCount: statusesCount!,
        note: note,
        // ignore:avoid-non-null-assertion
        locked: locked!,
        id: id,
        // ignore:avoid-non-null-assertion
        headerStatic: headerStatic!,
        // ignore:avoid-non-null-assertion
        header: header!,
        // ignore:avoid-non-null-assertion
        followingCount: followingCount!,
        // ignore:avoid-non-null-assertion
        followersCount: followersCount!,
        fields: fields?.toMastodonApiFieldList(),
        emojis: emojis?.toMastodonApiEmojiList(),
        displayName: displayName,
        createdAt: createdAt,
        bot: bot,
        avatarStatic: avatarStatic,
        avatar: avatar,
        acct: acct,
        lastStatusAt: lastStatusAt,
        suspended: suspended,
        muteExpiresAt: muteExpiresAt,
        source: MastodonApiMyAccountSource(
          privacy: privacy,
          sensitive: sensitive,
          language: language,
          note: note,
          fields: fields?.toMastodonApiFieldList(),
          followRequestsCount: followRequestsCount,
        ),
        discoverable: discoverable,
      );
}
