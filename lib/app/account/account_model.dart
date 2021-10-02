import 'package:fedi/app/database/app_database.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'account_model.freezed.dart';

typedef AccountCallback = Function(BuildContext context, IAccount account);
typedef AccountsListCallback = Function(
  BuildContext context,
  List<IAccount>? accounts,
);

abstract class IAccount {
  IAccount copyWithTemp({
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
    bool? deactivated,
    bool? allowFollowingMove,
    bool? skipThreadContainment,
    String? backgroundImage,
    bool? acceptsChatMessages,
  });

  String get username;

  String get url;

  int? get statusesCount;

  String? get note;

  bool? get bot;

  bool? get locked;

  int? get localId;

  String get remoteId;

  String? get headerStatic;

  String? get header;

  int? get followingCount;

  int? get followersCount;

  String? get displayName;

  DateTime get createdAt;

  String get avatarStatic;

  String get avatar;

  String get acct;

  DateTime? get lastStatusAt;

  List<IUnifediApiField>? get fields;

  List<IUnifediApiEmoji>? get emojis;

  String? get fqn;

  String? get backgroundImage;

  List<IUnifediApiTag>? get tags;

  IUnifediApiAccountRelationship? get relationship;

  bool? get isAdmin;

  bool? get isModerator;

  bool? get confirmationPending;

  bool? get hideFavorites;

  bool? get hideFollowers;

  bool? get hideFollows;

  bool? get hideFollowersCount;

  bool? get hideFollowsCount;

  bool? get deactivated;

  bool? get allowFollowingMove;

  bool? get acceptsChatMessages;

  bool? get skipThreadContainment;

  bool? get isConfirmed;

  String? get favicon;

  String? get apId;

  List<String>? get alsoKnownAs;

  bool? get suspended;

  DateTime? get muteExpiresAt;

  static List<IAccount> excludeAccountFromList(
    List<IAccount> accounts,
    bool Function(IAccount account) predicate,
  ) =>
      accounts
          .where(
            (account) => predicate(account),
          )
          .toList();
}

@freezed
class DbAccountPopulated with _$DbAccountPopulated {
  const factory DbAccountPopulated({
    required DbAccount dbAccount,
  }) = _DbAccountPopulated;
}

class DbAccountPopulatedWrapper implements IAccount {
  final DbAccountPopulated dbAccountPopulated;

  DbAccount get dbAccount => dbAccountPopulated.dbAccount;

  DbAccountPopulatedWrapper({
    required this.dbAccountPopulated,
  });

  @override
  String get acct => dbAccount.acct;

  @override
  String get avatar => dbAccount.avatar;

  @override
  String get avatarStatic => dbAccount.avatarStatic;

  @override
  bool? get bot => dbAccount.bot;

  @override
  DateTime get createdAt => dbAccount.createdAt;

  @override
  String get displayName => dbAccount.displayName!;

  @override
  List<IUnifediApiEmoji>? get emojis => dbAccount.emojis;

  @override
  List<IUnifediApiField>? get fields => dbAccount.fields;

  @override
  int? get followersCount => dbAccount.followersCount;

  @override
  int? get followingCount => dbAccount.followingCount;

  @override
  String? get header => dbAccount.header;

  @override
  String? get headerStatic => dbAccount.headerStatic;

  @override
  DateTime? get lastStatusAt => dbAccount.lastStatusAt;

  @override
  int? get localId => dbAccount.id;

  @override
  bool? get locked => dbAccount.locked;

  @override
  String? get note => dbAccount.note;

  @override
  bool? get allowFollowingMove => dbAccount.allowFollowingMove;

  @override
  bool? get confirmationPending => dbAccount.confirmationPending;

  @override
  bool? get deactivated => dbAccount.deactivated;

  @override
  bool? get hideFavorites => dbAccount.hideFavorites;

  @override
  bool? get hideFollowers => dbAccount.hideFollowers;

  @override
  bool? get hideFollowersCount => dbAccount.hideFollowersCount;

  @override
  bool? get hideFollows => dbAccount.hideFollows;

  @override
  bool? get hideFollowsCount => dbAccount.hideFollowsCount;

  @override
  bool? get isAdmin => dbAccount.isAdmin;

  @override
  bool? get isModerator => dbAccount.isModerator;

  @override
  bool? get acceptsChatMessages => dbAccount.acceptsChatMessages;

  @override
  UnifediApiAccountRelationship? get relationship => dbAccount.relationship;

  @override
  bool? get skipThreadContainment => dbAccount.skipThreadContainment;

  @override
  List<UnifediApiTag>? get tags => dbAccount.tags;

  @override
  String get remoteId => dbAccount.remoteId;

  @override
  int? get statusesCount => dbAccount.statusesCount;

  @override
  String get url => dbAccount.url;

  @override
  String get username => dbAccount.username;

  @override
  String? get backgroundImage => dbAccount.backgroundImage;

  @override
  List<String>? get alsoKnownAs => dbAccount.alsoKnownAs;

  @override
  String? get apId => dbAccount.apId;

  @override
  String? get favicon => dbAccount.favicon;

  @override
  bool? get isConfirmed => dbAccount.isConfirmed;

  @override
  String? get fqn => dbAccount.fqn;

  @override
  DateTime? get muteExpiresAt => dbAccount.muteExpiresAt;

  @override
  bool? get suspended => dbAccount.suspended;

  @override
  // ignore: long-parameter-list
  IAccount copyWithTemp({
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
    bool? deactivated,
    bool? allowFollowingMove,
    bool? skipThreadContainment,
    String? backgroundImage,
    bool? acceptsChatMessages,
  }) =>
      DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount.copyWith(
            id: id,
            remoteId: remoteId,
            username: username,
            url: url,
            note: note,
            locked: locked,
            headerStatic: headerStatic,
            header: header,
            followingCount: followingCount,
            followersCount: followersCount,
            statusesCount: statusesCount,
            displayName: displayName,
            createdAt: createdAt,
            bot: bot,
            avatarStatic: avatarStatic,
            avatar: avatar,
            acct: acct,
            lastStatusAt: lastStatusAt,
            fields: fields,
            emojis: emojis,
            relationship: relationship?.toUnifediApiAccountRelationship() ??
                this.relationship,
            tags: tags ?? this.tags,
            isAdmin: isAdmin ?? this.isAdmin,
            isModerator: isModerator ?? this.isModerator,
            confirmationPending:
                confirmationPending ?? this.confirmationPending,
            hideFavorites: hideFavorites ?? this.hideFavorites,
            hideFollowers: hideFollowers ?? this.hideFollowers,
            hideFollows: hideFollows ?? this.hideFollows,
            hideFollowersCount: hideFollowersCount ?? this.hideFollowersCount,
            hideFollowsCount: hideFollowsCount ?? this.hideFollowsCount,
            deactivated: deactivated ?? this.deactivated,
            allowFollowingMove: allowFollowingMove ?? this.allowFollowingMove,
            skipThreadContainment:
                skipThreadContainment ?? this.skipThreadContainment,
            backgroundImage: backgroundImage ?? this.backgroundImage,
            acceptsChatMessages:
                acceptsChatMessages ?? this.acceptsChatMessages,
          ),
        ),
      );
}

extension IAccountExtension on IAccount {
  DbAccountPopulatedWrapper toDbAccountWrapper() {
    if (this is DbAccountPopulatedWrapper) {
      return this as DbAccountPopulatedWrapper;
    } else {
      return DbAccountPopulatedWrapper(
        dbAccountPopulated: toDbAccountPopulated(),
      );
    }
  }

  DbAccountPopulated toDbAccountPopulated() {
    if (this is DbAccountPopulatedWrapper) {
      return (this as DbAccountPopulatedWrapper).dbAccountPopulated;
    } else {
      return DbAccountPopulated(
        dbAccount: toDbAccount(),
      );
    }
  }

  DbAccount toDbAccount() {
    if (this is DbAccountPopulatedWrapper) {
      return (this as DbAccountPopulatedWrapper).dbAccountPopulated.dbAccount;
    } else {
      return DbAccount(
        id: localId,
        remoteId: remoteId,
        username: username,
        url: url,
        note: note,
        locked: locked,
        headerStatic: headerStatic,
        header: header,
        followingCount: followingCount,
        followersCount: followersCount,
        statusesCount: statusesCount,
        displayName: displayName,
        createdAt: createdAt,
        bot: bot,
        avatarStatic: avatarStatic,
        avatar: avatar,
        acct: acct,
        lastStatusAt: lastStatusAt,
        fields: fields?.toUnifediApiFieldList(),
        emojis: emojis?.toUnifediApiEmojiList(),
        backgroundImage: backgroundImage,
        tags: tags?.toUnifediApiTagList(),
        relationship: relationship?.toUnifediApiAccountRelationship(),
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
      );
    }
  }

  bool get isAcctOnRemoteHost => acctRemoteHost?.isNotEmpty == true;

  String? get acctRemoteHost {
    var separatorIndex = acct.lastIndexOf('@');
    if (separatorIndex > 0) {
      return acct.substring(separatorIndex + 1);
    } else {
      return null;
    }
  }

  Uri get urlRemoteHostUri {
    var uri = Uri.parse(url);

    var resultUrl = '${uri.scheme}://${uri.host}';

    return Uri.parse(resultUrl);
  }

  String? get acctRemoteDomainOrNull {
    var usernameWithAt = '$username@';
    if (acct.contains(usernameWithAt)) {
      return acct.replaceAll(usernameWithAt, '');
    } else {
      return null;
    }
  }

  bool get isAcctRemoteDomainExist =>
      acctRemoteDomainOrNull?.isNotEmpty == true;
}
