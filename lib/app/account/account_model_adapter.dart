import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';

extension IPleromaAccountListDbExtension on List<IPleromaAccount> {
  List<DbAccountPopulatedWrapper> toDbAccountPopulatedWrappers() => map(
        (pleromaAccount) => pleromaAccount.toDbAccountWrapper(),
      ).toList();
}

extension IAccountListExtension on List<IAccount> {
  List<PleromaAccount> toPleromaAccounts() => map(
        (pleromaAccount) => pleromaAccount.toPleromaAccount(),
      ).toList();
}

extension DbAccountExtension on DbAccount {
  DbAccountPopulatedWrapper toDbAccountWrapper() => DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: this,
        ),
      );
}

extension IPleromaAccountDbExtension on IPleromaAccount {
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
        fields: fields?.toPleromaFields(),
        emojis: emojis?.toPleromaEmojis(),
        pleromaTags: pleroma?.tags?.toPleromaTags(),
        pleromaRelationship: pleroma?.relationship,
        pleromaIsAdmin: pleroma?.isAdmin,
        pleromaIsModerator: pleroma?.isModerator,
        pleromaConfirmationPending: pleroma?.confirmationPending,
        pleromaHideFavorites: pleroma?.hideFavorites,
        pleromaHideFollows: pleroma?.hideFollows,
        pleromaHideFollowers: pleroma?.hideFollowers,
        pleromaHideFollowersCount: pleroma?.hideFollowersCount,
        pleromaHideFollowsCount: pleroma?.hideFollowsCount,
        pleromaDeactivated: pleroma?.deactivated,
        pleromaAllowFollowingMove: pleroma?.allowFollowingMove,
        pleromaSkipThreadContainment: pleroma?.skipThreadContainment,
        pleromaBackgroundImage: pleroma?.backgroundImage,
        pleromaAcceptsChatMessages: pleroma?.acceptsChatMessages,
      );
}

extension IAccountPleromaAccountExtension on IAccount {
  PleromaAccountPleromaPart toPleromaAccountPleromaPart() {
    return PleromaAccountPleromaPart(
      backgroundImage: pleromaBackgroundImage,
      tags: pleromaTags,
      relationship: pleromaRelationship,
      isAdmin: pleromaIsAdmin,
      isModerator: pleromaIsModerator,
      confirmationPending: pleromaConfirmationPending,
      hideFavorites: pleromaHideFavorites,
      hideFollowers: pleromaHideFollowers,
      hideFollows: pleromaHideFollows,
      hideFollowersCount: pleromaHideFollowersCount,
      hideFollowsCount: pleromaHideFollowsCount,
      deactivated: pleromaDeactivated,
      allowFollowingMove: pleromaAllowFollowingMove,
      skipThreadContainment: pleromaSkipThreadContainment,
      acceptsChatMessages: pleromaAcceptsChatMessages,
      // todo: should be implemented
      apId: null,
      alsoKnownAs: null,
      isConfirmed: null,
      favicon: null,
    );
  }

  PleromaAccount toPleromaAccount() {
    var localAccount = this;
    return PleromaAccount(
      pleroma: localAccount.toPleromaAccountPleromaPart(),
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
      fields: localAccount.fields?.toPleromaFields(),
      emojis: localAccount.emojis?.toPleromaEmojis(),
      fqn: localAccount.fqn,
    );
  }
}
