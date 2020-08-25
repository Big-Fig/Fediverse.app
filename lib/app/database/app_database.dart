import 'package:fedi/app/account/database/account_database_dao.dart';
import 'package:fedi/app/account/database/account_database_model.dart';
import 'package:fedi/app/account/database/account_followers_database_dao.dart';
import 'package:fedi/app/account/database/account_followers_database_model.dart';
import 'package:fedi/app/account/database/account_followings_database_dao.dart';
import 'package:fedi/app/account/database/account_followings_database_model.dart';
import 'package:fedi/app/chat/database/chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/database/chat_accounts_database_model.dart';
import 'package:fedi/app/chat/database/chat_database_dao.dart';
import 'package:fedi/app/chat/database/chat_database_model.dart';
import 'package:fedi/app/chat/message/database/chat_message_database_dao.dart';
import 'package:fedi/app/chat/message/database/chat_message_database_model.dart';
import 'package:fedi/app/conversation/database/conversation_accounts_database_dao.dart';
import 'package:fedi/app/conversation/database/conversation_accounts_database_model.dart';
import 'package:fedi/app/conversation/database/conversation_database_dao.dart';
import 'package:fedi/app/conversation/database/conversation_database_model.dart';
import 'package:fedi/app/conversation/database/conversation_statuses_database_dao.dart';
import 'package:fedi/app/conversation/database/conversation_statuses_database_model.dart';
import 'package:fedi/app/moor/moor_converters.dart';
import 'package:fedi/app/notification/database/notification_database_dao.dart';
import 'package:fedi/app/notification/database/notification_database_model.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_dao.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_model.dart';
import 'package:fedi/app/status/database/status_database_dao.dart';
import 'package:fedi/app/status/database/status_database_model.dart';
import 'package:fedi/app/status/database/status_favourited_accounts_database_dao.dart';
import 'package:fedi/app/status/database/status_favourited_accounts_database_model.dart';
import 'package:fedi/app/status/database/status_hashtags_database_dao.dart';
import 'package:fedi/app/status/database/status_hashtags_database_model.dart';
import 'package:fedi/app/status/database/status_lists_database_dao.dart';
import 'package:fedi/app/status/database/status_lists_database_model.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_dao.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_model.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_dao.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:moor/moor.dart';

part 'app_database.g.dart';

@UseMoor(tables: [
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
//  DbChats,
//  DbChatAccounts,
//  DbChatMessages,
  DbHomeTimelineStatuses
//  DbAccountRelationships
], daos: [
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
  ChatDao,
  ChatAccountsDao,
  ChatMessageDao,
  HomeTimelineStatusesDao,
//  AccountRelationshipsDao
], include: {
  'app_database.moor'
})
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;


  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) => m.createAll(),
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1 && to == 2) {
          await m.addColumn(dbChatMessages, dbChatMessages.card);
        }
      }
  );
}

