import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/account/relationship/unifedi_api_account_relationship_model.dart';
import '../../api/account/unifedi_api_account_model.dart';
import '../../api/emoji/unifedi_api_emoji_model.dart';
import '../../api/field/unifedi_api_field_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';
import '../emoji/unifedi_api_emoji_model_pleroma_adapter.dart';
import '../field/unifedi_api_field_model_pleroma_adapter.dart';
import '../tag/unifedi_api_tag_model_pleroma_adapter.dart';
import 'relationship/unifedi_api_account_relationship_model_pleroma_adapter.dart';

part 'unifedi_api_account_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_account_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountPleromaAdapter
    with _$UnifediApiAccountPleromaAdapter
    implements IUnifediApiAccount {
  const UnifediApiAccountPleromaAdapter._();

  const factory UnifediApiAccountPleromaAdapter(
    @HiveField(0) PleromaApiAccount value,
  ) = _UnifediApiAccountPleromaAdapter;

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
  bool? get suspended => value.suspended;

  @override
  DateTime? get muteExpiresAt => value.muteExpiresAt;

  factory UnifediApiAccountPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountPleromaAdapterFromJson(json);
}

extension PleromaApiAccountUnifediExtension on IPleromaApiAccount {
  UnifediApiAccountPleromaAdapter toUnifediApiAccountPleromaAdapter() =>
      UnifediApiAccountPleromaAdapter(
        toPleromaApiAccount(),
      );
}

extension PleromaApiAccountUnifediListExtension on List<IPleromaApiAccount> {
  List<UnifediApiAccountPleromaAdapter>
      toUnifediApiAccountPleromaAdapterList() => map(
            (item) => item.toUnifediApiAccountPleromaAdapter(),
          ).toList();
}

extension UnifediApiAccountPleromaExtension on IUnifediApiAccount {
  PleromaApiAccount toPleromaApiAccount() => PleromaApiAccount(
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
        pleroma: PleromaApiAccountPleromaPart(
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
        ),
        lastStatusAt: lastStatusAt,
        fqn: fqn,
        suspended: suspended,
        muteExpiresAt: muteExpiresAt,
      );
}
