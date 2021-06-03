import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';

extension IPleromaAccountListDbExtension on List<IPleromaApiAccount> {
  List<DbAccountPopulatedWrapper> toDbAccountPopulatedWrappers() => map(
        (pleromaAccount) => pleromaAccount.toDbAccountWrapper(),
      ).toList();
}

extension IAccountListExtension on List<IAccount> {
  List<PleromaApiAccount> toPleromaApiAccounts() => map(
        (pleromaAccount) => pleromaAccount.toPleromaApiAccount(),
      ).toList();
}

extension DbAccountExtension on DbAccount {
  DbAccountPopulatedWrapper toDbAccountWrapper() => DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: this,
        ),
      );
}

extension IPleromaAccountDbExtension on IPleromaApiAccount {
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
        fields: fields?.toPleromaApiFields(),
        emojis: emojis?.toPleromaApiEmojis(),
        pleromaTags: pleroma?.tags?.toPleromaApiTags(),
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
  PleromaApiAccountPleromaPart toPleromaApiAccountPleromaPart() {
    return PleromaApiAccountPleromaPart(
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

  PleromaApiAccount toPleromaApiAccount() {
    var localAccount = this;
    return PleromaApiAccount(
      pleroma: localAccount.toPleromaApiAccountPleromaPart(),
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
      fields: localAccount.fields?.toPleromaApiFields(),
      emojis: localAccount.emojis?.toPleromaApiEmojis(),
      fqn: localAccount.fqn,
    );
  }
}
