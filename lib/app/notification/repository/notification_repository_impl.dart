import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/notification/database/notification_database_dao.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_model_adapter.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:moor/moor.dart';

class NotificationRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbNotification,
    DbNotificationPopulated,
    INotification,
    IPleromaNotification,
    int,
    String,
    $DbNotificationsTable,
    $DbNotificationsTable,
    NotificationRepositoryFilters,
    NotificationRepositoryOrderingTermData> implements INotificationRepository {
  @override
  final NotificationDao dao;
  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IPleromaChatMessageRepository chatMessageRepository;

  @override
  PopulatedDatabaseDaoMixin<
      DbNotification,
      DbNotificationPopulated,
      int,
      $DbNotificationsTable,
      $DbNotificationsTable,
      NotificationRepositoryFilters,
      NotificationRepositoryOrderingTermData> get populatedDao => dao;

  NotificationRepository({
    required AppDatabase appDatabase,
    required this.accountRepository,
    required this.statusRepository,
    required this.chatMessageRepository,
  }) : dao = appDatabase.notificationDao;

  //
  // @override
  // Future upsertRemoteNotification(
  //   IPleromaNotification remoteNotification, {
  //   required bool? unread,
  // }) async {
  //   _logger.finer(() => "upsertRemoteNotification ${remoteNotification.id} "
  //       "$remoteNotification");
  //   var remoteAccount = remoteNotification.account;
  //
  //   if (remoteAccount != null) {
  //     await accountRepository.upsertRemoteAccount(
  //       remoteAccount,
  //       conversationRemoteId: null,
  //       chatRemoteId: null,
  //     );
  //   }
  //
  //   var remoteStatus = remoteNotification.status;
  //   if (remoteStatus != null) {
  //     await statusRepository.upsertRemoteStatus(
  //       remoteStatus,
  //       listRemoteId: null,
  //       conversationRemoteId: null,
  //     );
  //   }
  //   var remoteChatMessage = remoteNotification.chatMessage;
  //   if (remoteChatMessage != null) {
  //     await chatMessageRepository.upsertRemoteChatMessage(
  //       remoteChatMessage,
  //     );
  //   }
  //   await upsertInDbType(
  //     remoteNotification.toDbNotification(
  //       unread: unread,
  //     ),
  //   );
  // }
  //
  // @override
  // Future upsertRemoteNotifications(
  //   List<IPleromaNotification>? remoteNotifications, {
  //   required bool? unread,
  // }) async {
  //   _logger.finer(
  //     () => "upsertRemoteNotifications ${remoteNotifications!.length} ",
  //   );
  //   if (remoteNotifications!.isEmpty) {
  //     return;
  //   }
  //
  //   List<IPleromaAccount> remoteAccounts = remoteNotifications
  //       .where((remoteNotification) => remoteNotification.account != null)
  //       .map(
  //         (remoteNotification) => remoteNotification.account!,
  //       )
  //       .toList();
  //
  //   await accountRepository.upsertRemoteAccounts(
  //     remoteAccounts,
  //     conversationRemoteId: null,
  //     chatRemoteId: null,
  //   );
  //
  //   List<IPleromaStatus> remoteStatuses = remoteNotifications
  //       .where((remoteNotification) => remoteNotification.status != null)
  //       .map(
  //         (remoteNotification) => remoteNotification.status!,
  //       )
  //       .toList();
  //
  //   await statusRepository.upsertRemoteStatuses(
  //     remoteStatuses,
  //     conversationRemoteId: null,
  //     listRemoteId: null,
  //   );
  //
  //   List<IPleromaChatMessage> remoteChatMessages = remoteNotifications
  //       .where((remoteNotification) => remoteNotification.chatMessage != null)
  //       .map(
  //         (remoteNotification) => remoteNotification.chatMessage!,
  //       )
  //       .toList();
  //
  //   await chatMessageRepository.upsertRemoteChatMessages(remoteChatMessages);
  //
  //   await upsertAllInDbType(
  //     remoteNotifications
  //         .map(
  //           (remoteNotification) =>
  //               remoteNotification.toDbNotification(unread: unread),
  //         )
  //         .toList(),
  //   );
  // }
  //
  // @override
  // Future updateLocalNotificationByRemoteNotification({
  //   required INotification oldLocalNotification,
  //   required IPleromaNotification newRemoteNotification,
  //   required bool? unread,
  // }) async {
  //   _logger.finer(() => "updateLocalNotificationByRemoteNotification \n"
  //       "\t old: $oldLocalNotification \n"
  //       "\t newRemoteNotification: $newRemoteNotification");
  //
  //   var remoteAccount = newRemoteNotification.account;
  //
  //   if (remoteAccount != null) {
  //     await accountRepository.upsertRemoteAccount(
  //       remoteAccount,
  //       conversationRemoteId: null,
  //       chatRemoteId: null,
  //     );
  //   }
  //
  //   var remoteStatus = newRemoteNotification.status;
  //
  //   if (remoteStatus != null) {
  //     await statusRepository.upsertRemoteStatus(
  //       remoteStatus,
  //       conversationRemoteId: null,
  //       listRemoteId: null,
  //     );
  //   }
  //
  //   await updateByDbIdInDbType(
  //     dbId: oldLocalNotification.localId!,
  //     dbItem: newRemoteNotification.toDbNotification(
  //       unread: unread,
  //     ),
  //   );
  // }
  //
  // @override
  // Future<DbNotificationPopulatedWrapper?> getNotification({
  //   required NotificationRepositoryFilters? filters,
  //   NotificationRepositoryOrderingTermData? orderingTermData =
  //       NotificationRepositoryOrderingTermData.createdAtDesc,
  // }) async {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: _singleNotificationRepositoryPagination,
  //     orderingTermData: orderingTermData,
  //   );
  //
  //   return (await query.getSingleOrNull())
  //       ?.toDbNotificationPopulated(dao: dao)
  //       .toDbNotificationPopulatedWrapper();
  // }
  //
  // @override
  // Stream<DbNotificationPopulatedWrapper?> watchNotification({
  //   required NotificationRepositoryFilters? filters,
  //   NotificationRepositoryOrderingTermData? orderingTermData =
  //       NotificationRepositoryOrderingTermData.createdAtDesc,
  // }) {
  //   var query = createQuery(
  //     filters: filters,
  //     pagination: _singleNotificationRepositoryPagination,
  //     orderingTermData: orderingTermData,
  //   );
  //
  //   return query.watchSingleOrNull().map(
  //         (typedResult) => typedResult
  //             ?.toDbNotificationPopulated(dao: dao)
  //             .toDbNotificationPopulatedWrapper(),
  //       );
  // }

  @override
  Future markAsRead({
    required INotification notification,
  }) {
    return dao.markAsRead(
      remoteId: notification.remoteId,
    );
  }

  @override
  Future dismiss({
    required INotification notification,
  }) {
    return dao.markAsDismissed(
      remoteId: notification.remoteId,
    );
  }

  @override
  Future dismissAll() {
    return dao.markAllAsDismissed();
  }

  @override
  Future markAllAsRead() => dao.markAllAsRead();

  @override
  Future dismissFollowRequestNotificationsFromAccount({
    required IAccount account,
    required Batch? batchTransaction,
  }) =>
      dao.markAsDismissedWhere(
        accountRemoteId: account.remoteId,
        type: PleromaNotificationType.followRequest,
      );

  @override
  DbNotification mapAppItemToDbItem(INotification appItem) =>
      appItem.toDbNotification();

  @override
  IPleromaNotification mapAppItemToRemoteItem(INotification appItem) =>
      appItem.toPleromaNotification();

  @override
  DbNotificationPopulated mapAppItemToDbPopulatedItem(INotification appItem) {
    return appItem.toDbNotificationPopulated();
  }

  @override
  INotification mapDbPopulatedItemToAppItem(
    DbNotificationPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem.toDbNotificationPopulatedWrapper();

  @override
  IPleromaNotification mapDbPopulatedItemToRemoteItem(
    DbNotificationPopulated dbPopulatedItem,
  ) =>
      dbPopulatedItem
          .toDbNotificationPopulatedWrapper()
          .toPleromaNotification();

  @override
  NotificationRepositoryFilters get emptyFilters =>
      NotificationRepositoryFilters.empty;

  @override
  List<NotificationRepositoryOrderingTermData> get defaultOrderingTerms =>
      NotificationRepositoryOrderingTermData.defaultTerms;
}

extension DbNotificationPopulatedListExtension
    on List<DbNotificationPopulated> {
  List<DbNotificationPopulatedWrapper> toDbNotificationPopulatedWrapperList() =>
      map(
        (item) => item.toDbNotificationPopulatedWrapper(),
      ).toList();
}

extension DbNotificationPopulatedWrapperExtension
    on DbNotificationPopulatedWrapper {
  DbNotification toDbNotification() => dbNotificationPopulated.dbNotification;
}
