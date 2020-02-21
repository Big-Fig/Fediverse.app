import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';


DbAccount mapRemoteAccountToDbAccount(IPleromaAccount remoteAccount) {
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
      avatarStatic: remoteAccount.avatarStatic,
      avatar: remoteAccount.avatar,
      acct: remoteAccount.acct,
      lastStatusAt: remoteAccount.lastStatusAt);
}

// TODO: temporary solution for refactoring period
PleromaAccount mapLocalAccountToRemoteAccount(IAccount localAccount) {
  return PleromaAccount(
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
      avatarStatic: localAccount.avatarStatic,
      avatar: localAccount.avatar,
      acct: localAccount.acct,
      lastStatusAt: localAccount.lastStatusAt);
}
