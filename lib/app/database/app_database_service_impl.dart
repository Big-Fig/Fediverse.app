import 'dart:io';
import 'dart:math';

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/ffi.dart';
import 'package:moor_inspector/moor_inspector.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class AppDatabaseService extends AsyncInitLoadingBloc
    implements IDatabaseService {
  final String dbName;

  AppDatabaseService({
    @required this.dbName,
  });

  AppDatabase appDatabase;

  MoorInspector inspector;

  String filePath;
  File file;

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

    addDisposable(
      disposable: CustomDisposable(
        () async {
          await appDatabase.close();
        },
      ),
    );

    if (!kReleaseMode) {
      await _addMoorInspectorSupport();
    }
  }

  Future _addMoorInspectorSupport() async {
    var packageId = await FediPackageInfoHelper.getPackageId();

    final moorInspectorBuilder = MoorInspectorBuilder()
      ..bundleId = packageId
      ..icon = 'flutter'
      ..addDatabase(filePath, appDatabase);
    inspector = moorInspectorBuilder.build();

    //Start server and announcement server
    await inspector.start();

    addDisposable(custom: () async {
      await inspector.stop();
    });
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
    var statusesCount = await appDatabase.statusDao.countAll().getSingle();
    var notificationsCount =
        await appDatabase.notificationDao.countAll().getSingle();
    var chatMessagesCount =
        await appDatabase.chatMessageDao.countAll().getSingle();

    var accountsCount = await appDatabase.accountDao.countAll().getSingle();

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
  Future<DateTime> calculateOldestEntryAge() async {
    var oldestStatus = await appDatabase.statusDao.oldest().getSingle();
    var oldestNotification =
        await appDatabase.notificationDao.oldest().getSingle();
    var oldestChatMessage =
        await appDatabase.chatMessageDao.oldest().getSingle();

    var dateTimes = <DateTime>[
      oldestStatus?.createdAt,
      oldestNotification?.createdAt,
      oldestChatMessage?.createdAt,
    ].where((datetime) => datetime != null).toList();

    var oldestDateTime;
    if (dateTimes.isNotEmpty) {
      oldestDateTime = dateTimes.reduce(
          (value, element) => value.isBefore(element) ? value : element);
    }

    return oldestDateTime;
  }

  @override
  Future clearAll() async {
    for (var table in appDatabase.allTables) {
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      await appDatabase.delete(table).go();
    }
  }

  @override
  Future clearByLimits({
    @required Duration ageLimit,
    @required int entriesCountByTypeLimit,
  }) async {

    // todo: clear related tables too

    if (ageLimit != null) {
      var now = DateTime.now();
      var dateTimeToDelete = now.subtract(ageLimit.abs());
      await appDatabase.statusDao.deleteOlderThanDate(dateTimeToDelete);
      await appDatabase.notificationDao.deleteOlderThanDate(dateTimeToDelete);
      await appDatabase.chatMessageDao.deleteOlderThanDate(dateTimeToDelete);
    }

    if (entriesCountByTypeLimit != null) {
      var oldestAccountToStartToDelete = await appDatabase.accountDao
          .getNewestByLocalIdWithOffset(entriesCountByTypeLimit)
          .getSingle();
      if (oldestAccountToStartToDelete != null) {
        await appDatabase.accountDao
            .deleteOlderThanLocalId(oldestAccountToStartToDelete.id);
      }

      var oldestStatusToStartToDelete = await appDatabase.statusDao
          .getNewestByLocalIdWithOffset(entriesCountByTypeLimit)
          .getSingle();
      if (oldestStatusToStartToDelete != null) {
        await appDatabase.statusDao
            .deleteOlderThanLocalId(oldestStatusToStartToDelete.id);
      }

      var oldestNotificationToStartToDelete = await appDatabase.notificationDao
          .getNewestByLocalIdWithOffset(entriesCountByTypeLimit)
          .getSingle();
      if (oldestNotificationToStartToDelete != null) {
        await appDatabase.notificationDao
            .deleteOlderThanLocalId(oldestNotificationToStartToDelete.id);
      }

      var oldestChatMessageToStartToDelete = await appDatabase.chatMessageDao
          .getNewestByLocalIdWithOffset(entriesCountByTypeLimit)
          .getSingle();
      if (oldestNotificationToStartToDelete != null) {
        await appDatabase.chatMessageDao
            .deleteOlderThanLocalId(oldestChatMessageToStartToDelete.id);
      }
    }
  }
}
