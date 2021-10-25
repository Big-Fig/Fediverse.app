import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IUnifediApiAccountListDbExtension on List<IUnifediApiAccount> {
  List<DbAccountPopulatedWrapper> toDbAccountPopulatedWrappers() => map(
        (unifediApiAccount) => unifediApiAccount.toDbAccountWrapper(),
      ).toList();
}

extension IAccountListExtension on List<IAccount> {
  List<UnifediApiAccount> toUnifediApiAccountList() => map(
        (unifediApiAccount) => unifediApiAccount.toUnifediApiAccount(),
      ).toList();
}

extension DbAccountExtension on DbAccount {
  DbAccountPopulatedWrapper toDbAccountWrapper() => DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: this,
        ),
      );
}

extension IUnifediApiAccountDbExtension on IUnifediApiAccount {
  DbAccountPopulatedWrapper toDbAccountWrapper() => DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: toDbAccount(),
        ),
      );

  DbAccount toDbAccount() => DbAccount(
        id: null,
        remoteId: id,
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
        tags: tags?.toUnifediApiTagList(),
        relationship: relationship?.toUnifediApiAccountRelationship(),
        isAdmin: isAdmin,
        isModerator: isModerator,
        confirmationPending: confirmationPending,
        hideFavorites: hideFavorites,
        hideFollows: hideFollows,
        hideFollowers: hideFollowers,
        hideFollowersCount: hideFollowersCount,
        hideFollowsCount: hideFollowsCount,
        deactivated: deactivated,
        allowFollowingMove: allowFollowingMove,
        skipThreadContainment: skipThreadContainment,
        backgroundImage: backgroundImage,
        acceptsChatMessages: acceptsChatMessages,
        // todo: should be implemented
        // apId: null,
        // alsoKnownAs: null,
        // isConfirmed: null,
        // favicon: null,
      );
}

extension IAccountUnifediApiAccountExtension on IAccount {
  UnifediApiAccount toUnifediApiAccount() {
    var localAccount = this;

    return UnifediApiAccount(
      id: localAccount.remoteId,
      username: localAccount.username,
      url: localAccount.url,
      note: localAccount.note,
      locked: localAccount.locked,
      headerStatic: localAccount.headerStatic,
      header: localAccount.header,
      followingCount: localAccount.followingCount,
      followersCount: localAccount.followersCount,
      statusesCount: localAccount.statusesCount,
      displayName: localAccount.displayName,
      createdAt: localAccount.createdAt,
      bot: localAccount.bot,
      avatarStatic: localAccount.avatarStatic,
      avatar: localAccount.avatar,
      acct: localAccount.acct,
      lastStatusAt: localAccount.lastStatusAt,
      fields: localAccount.fields?.toUnifediApiFieldList(),
      emojis: localAccount.emojis?.toUnifediApiEmojiList(),
      fqn: localAccount.fqn,
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
      isConfirmed: isConfirmed,
      favicon: favicon,
      apId: apId,
      suspended: suspended,
      alsoKnownAs: alsoKnownAs,
      muteExpiresAt: muteExpiresAt,
    );
  }
}
