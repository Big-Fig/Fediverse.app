import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';

DbAccountWrapper mapRemoteAccountToLocalAccount(IPleromaAccount remoteAccount) {
  return DbAccountWrapper(mapRemoteAccountToDbAccount(remoteAccount));
}

DbAccount mapRemoteAccountToDbAccount(IPleromaAccount remoteAccount) {
  if (remoteAccount == null) {
    return null;
  }
  assert(remoteAccount.id != null);
  return DbAccount(
    id: null,
    remoteId: remoteAccount.id,
    username: remoteAccount.username,
    url: remoteAccount.url,
    note: remoteAccount.note,
    locked: remoteAccount.locked,
    headerStatic: remoteAccount.headerStatic,
    header: remoteAccount.header,
    followingCount: remoteAccount.followingCount,
    followersCount: remoteAccount.followersCount,
    statusesCount: remoteAccount.statusesCount,
    displayName: remoteAccount.displayName,
    createdAt: remoteAccount.createdAt,
    bot: remoteAccount.bot,
    avatarStatic: remoteAccount.avatarStatic,
    avatar: remoteAccount.avatar,
    acct: remoteAccount.acct,
    lastStatusAt: remoteAccount.lastStatusAt,
    fields: remoteAccount.fields,
    emojis: remoteAccount.emojis,
// tags have invalid schema
// todo: revert when bug will be fixed in Pleroma
//    pleromaTags: remoteAccount.pleroma?.tags,
    pleromaRelationship: remoteAccount.pleroma?.relationship,
    pleromaIsAdmin: remoteAccount.pleroma?.isAdmin,
    pleromaIsModerator: remoteAccount.pleroma?.isModerator,
    pleromaConfirmationPending: remoteAccount.pleroma?.confirmationPending,
    pleromaHideFavorites: remoteAccount.pleroma?.hideFavorites,
    pleromaHideFollows: remoteAccount.pleroma?.hideFollows,
    pleromaHideFollowers: remoteAccount.pleroma?.hideFollowers,
    pleromaHideFollowersCount: remoteAccount.pleroma?.hideFollowersCount,
    pleromaHideFollowsCount: remoteAccount.pleroma?.hideFollowsCount,
    pleromaDeactivated: remoteAccount.pleroma?.deactivated,
    pleromaAllowFollowingMove: remoteAccount.pleroma?.allowFollowingMove,
    pleromaSkipThreadContainment: remoteAccount.pleroma?.skipThreadContainment,
    pleromaBackgroundImage: remoteAccount.pleroma?.backgroundImage,
    pleromaAcceptsChatMessages: remoteAccount.pleroma?.acceptsChatMessages,
  );
}

PleromaAccount mapLocalAccountToRemoteAccount(IAccount localAccount) {
  return PleromaAccount(
    pleroma: PleromaAccountPleromaPart(
      backgroundImage: localAccount.pleromaBackgroundImage,
      tags: localAccount.pleromaTags,
      relationship: localAccount.pleromaRelationship,
      isAdmin: localAccount.pleromaIsAdmin,
      isModerator: localAccount.pleromaIsModerator,
      confirmationPending: localAccount.pleromaConfirmationPending,
      hideFavorites: localAccount.pleromaHideFavorites,
      hideFollowers: localAccount.pleromaHideFollowers,
      hideFollows: localAccount.pleromaHideFollows,
      hideFollowersCount: localAccount.pleromaHideFollowersCount,
      hideFollowsCount: localAccount.pleromaHideFollowsCount,
      deactivated: localAccount.pleromaDeactivated,
      allowFollowingMove: localAccount.pleromaAllowFollowingMove,
      skipThreadContainment: localAccount.pleromaSkipThreadContainment,
      acceptsChatMessages: localAccount.pleromaAcceptsChatMessages,
    ),
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
    fields: localAccount.fields,
    emojis: localAccount.emojis,
  );
}
