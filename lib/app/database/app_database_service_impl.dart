import 'dart:io';
import 'dart:math';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/database/database_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/ffi.dart';
import 'package:moor_inspector/moor_inspector.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

final _logger = Logger('app_database_service_impl.dart');

class AppDatabaseService extends AsyncInitLoadingBloc
    implements IDatabaseService {
  final IConfigService configService;
  final String dbName;

  AppDatabaseService({
    required this.dbName,
    required this.configService,
  });

  AppDatabaseService.forUserAtHost({
    required String userAtHost,
    required IConfigService configService,
  }) : this(
          dbName: userAtHost,
          configService: configService,
        );

  // ignore: avoid-late-keyword
  late AppDatabase appDatabase;

  // ignore: avoid-late-keyword
  late MoorInspector inspector;

  // ignore: avoid-late-keyword
  late String filePath;

  // ignore: avoid-late-keyword
  late File file;

  @override
  Future<int> calculateSizeInBytes() => file.length();

  @override
  Future internalAsyncInit() async {
    filePath = await calculateDatabaseFilePath(dbName);
    file = File(filePath);

    appDatabase = AppDatabase(
      VmDatabase(
        file,
        logStatements: false,
      ),
    );

    addCustomDisposable(() => appDatabase.close());

    if (!kReleaseMode) {
      await _addMoorInspectorSupport();
    }
  }

  Future _addMoorInspectorSupport() async {
    var packageId = configService.appId;

    final moorInspectorBuilder = MoorInspectorBuilder()
      ..bundleId = packageId
      ..icon = 'flutter'
      ..addDatabase(filePath, appDatabase);
    inspector = moorInspectorBuilder.build();

    //Start server and announcement server
    await inspector.start();

    addCustomDisposable(
      () => inspector.stop(),
    );
  }

  static Future<String> calculateDatabaseFilePath(String dbName) async {
    var path = '$dbName.sqlite';
    final dbFolder = await getApplicationDocumentsDirectory();
    var filePath = p.join(
      dbFolder.path,
      path,
    );

    return filePath;
  }

  @override
  Future delete() async {
    await appDatabase.close();
    await file.delete();
  }

  static AppDatabaseService of(BuildContext context, {bool listen = true}) =>
      Provider.of<AppDatabaseService>(context, listen: listen);

  @override
  Future<int> calculateMaxCountByType() async {
    var statusesCount = await appDatabase.statusDao.countAll();
    var notificationsCount = await appDatabase.notificationDao.countAll();
    var chatMessagesCount = await appDatabase.chatMessageDao.countAll();

    var accountsCount = await appDatabase.accountDao.countAll();

    var counts = <int>[
      statusesCount,
      notificationsCount,
      chatMessagesCount,
      accountsCount,
    ];

    var maxCount = counts.reduce(
      (value, element) => max(
        value,
        element,
      ),
    );

    return maxCount;
  }

  @override
  Future<DateTime?> calculateOldestEntryAge() async {
    var oldestStatus =
        await appDatabase.statusDao.getOldestOrderById(offset: null);
    var oldestNotification =
        await appDatabase.notificationDao.getOldestOrderById(offset: null);
    var oldestChatMessage =
        await appDatabase.chatMessageDao.getOldestOrderById(offset: null);

    var dateTimes = <DateTime?>[
      oldestStatus?.createdAt,
      oldestNotification?.createdAt,
      oldestChatMessage?.createdAt,
    ].where((datetime) => datetime != null).toList();

    DateTime? oldestDateTime;
    if (dateTimes.isNotEmpty) {
      oldestDateTime = dateTimes.reduce(
        (value, element) => value!.isBefore(element!) ? value : element,
      );
    }

    return oldestDateTime;
  }

  @override
  Future clearAll() async {
    for (final table in appDatabase.allTables) {
      // ignore: invalid_use_of_visible_for_testing_member,
      // ignore: implicit_dynamic_method
      await appDatabase.delete(table).go();
    }
  }

  @override
  // todo: refactor
  // ignore: long-method
  Future clearByLimits({
    required Duration? ageLimit,
    required int? entriesCountByTypeLimit,
  }) async {
    _logger.finest(
      () => 'clearByLimits \n'
          'ageLimit $ageLimit \n'
          'entriesCountByTypeLimit $entriesCountByTypeLimit \n',
    );

    // todo: clear related tables too

    if (ageLimit != null) {
      var now = DateTime.now();
      var dateTimeToDelete = now.subtract(ageLimit.abs());
      await appDatabase.batch((batch) {
        appDatabase.statusDao.deleteOlderThanDate(
          dateTimeToDelete,
          batchTransaction: batch,
        );
        appDatabase.notificationDao.deleteOlderThanDate(
          dateTimeToDelete,
          batchTransaction: batch,
        );
        appDatabase.chatMessageDao.deleteOlderThanDate(
          dateTimeToDelete,
          batchTransaction: batch,
        );
      });
    }

    if (entriesCountByTypeLimit != null) {
      if ((await appDatabase.accountDao.countAll()) > entriesCountByTypeLimit) {
        var oldestAccountToStartToDelete = await appDatabase.accountDao
            .getNewestOrderById(offset: entriesCountByTypeLimit);
        if (oldestAccountToStartToDelete != null) {
          await appDatabase.accountDao.deleteOlderThanInt(
            oldestAccountToStartToDelete.id!,
            fieldName: appDatabase.accountDao.dbAccounts.id.$name,
            batchTransaction: null,
          );
        }
      }

      if ((await appDatabase.statusDao.countAll()) > entriesCountByTypeLimit) {
        var oldestStatusToStartToDelete = await appDatabase.statusDao
            .getNewestOrderById(offset: entriesCountByTypeLimit);
        if (oldestStatusToStartToDelete != null) {
          await appDatabase.statusDao.deleteOlderThanInt(
            oldestStatusToStartToDelete.id!,
            fieldName: appDatabase.statusDao.dbStatuses.id.$name,
            batchTransaction: null,
          );
        }
      }

      if ((await appDatabase.notificationDao.countAll()) >
          entriesCountByTypeLimit) {
        var oldestNotificationToStartToDelete = await appDatabase
            .notificationDao
            .getNewestOrderById(offset: entriesCountByTypeLimit);
        if (oldestNotificationToStartToDelete != null) {
          await appDatabase.notificationDao.deleteOlderThanInt(
            oldestNotificationToStartToDelete.id!,
            fieldName: appDatabase.notificationDao.dbNotifications.id.$name,
            batchTransaction: null,
          );
        }
      }

      if ((await appDatabase.chatMessageDao.countAll()) >
          entriesCountByTypeLimit) {
        var oldestChatMessageToStartToDelete = await appDatabase.chatMessageDao
            .getNewestOrderById(offset: entriesCountByTypeLimit);
        if (oldestChatMessageToStartToDelete != null) {
          await appDatabase.chatMessageDao.deleteOlderThanInt(
            oldestChatMessageToStartToDelete.id!,
            fieldName: appDatabase.chatMessageDao.dbChatMessages.id.$name,
            batchTransaction: null,
          );
        }
      }
    }
  }
}
