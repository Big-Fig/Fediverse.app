import 'package:fedi/refactored/app/account/database/account_database_dao.dart';
import 'package:fedi/refactored/app/account/database/account_database_model.dart';
import 'package:fedi/refactored/app/account/database/account_followers_database_dao.dart';
import 'package:fedi/refactored/app/account/database/account_followers_database_model.dart';
import 'package:fedi/refactored/app/account/database/account_followings_database_dao.dart';
import 'package:fedi/refactored/app/account/database/account_followings_database_model.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_accounts_database_dao.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_accounts_database_model.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_database_dao.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_database_model.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_statuses_database_dao.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_statuses_database_model.dart';
import 'package:fedi/refactored/app/moor/moor_converters.dart';
import 'package:fedi/refactored/app/notification/database/notification_database_dao.dart';
import 'package:fedi/refactored/app/notification/database/notification_database_model.dart';
import 'package:fedi/refactored/app/status/database/status_database_dao.dart';
import 'package:fedi/refactored/app/status/database/status_database_model.dart';
import 'package:fedi/refactored/app/status/database/status_favourited_accounts_database_dao.dart';
import 'package:fedi/refactored/app/status/database/status_favourited_accounts_database_model.dart';
import 'package:fedi/refactored/app/status/database/status_hashtags_database_dao.dart';
import 'package:fedi/refactored/app/status/database/status_hashtags_database_model.dart';
import 'package:fedi/refactored/app/status/database/status_lists_database_dao.dart';
import 'package:fedi/refactored/app/status/database/status_lists_database_model.dart';
import 'package:fedi/refactored/app/status/database/status_reblogged_accounts_database_dao.dart';
import 'package:fedi/refactored/app/status/database/status_reblogged_accounts_database_model.dart';
import 'package:fedi/refactored/app/status/scheduled/database/scheduled_status_database_dao.dart';
import 'package:fedi/refactored/app/status/scheduled/database/scheduled_status_database_model.dart';
import 'package:fedi/refactored/mastodon/notification'
    '/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:moor/moor.dart';

part 'app_database.g.dart';

@UseMoor(
  tables: [
    // todo: remove hack
    // bug in moor - https://github.com/simolus3/moor/issues/447
    // we should exclude tables here because we use this tables in
    // app_database.moor
//    DbStatuses,
//    DbConversations,
//    DbNotifications,
//    DbAccounts,
//    DbConversationStatuses,
//    DbStatusHashtags,
//    DbStatusLists,
//    DbStatusFavouritedAccounts,
//    DbStatusRebloggedAccounts,
//    DbAccountFollowings,
//    DbAccountFollowers,
//    DbConversationAccounts,
//    DbScheduledStatuses,
  ],
  daos: [
    StatusDao,
    StatusHashtagsDao,
    StatusListsDao,
    AccountDao,
    AccountFollowingsDao,
    AccountFollowersDao,
    ConversationDao,
    ConversationAccountsDao,
    ConversationStatusesDao,
    StatusFavouritedAccountsDao,
    StatusRebloggedAccountsDao,
    NotificationDao,
    ScheduledStatusDao,
  ],
  include: {'app_database.moor'}
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
