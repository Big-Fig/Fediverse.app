import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/notification/repository/notification_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

class NotificationRepositoryMockHelper {
  static Future<DbNotification> insertDbNotification(
    NotificationRepository notificationRepository,
    DbNotification notificationData,
  ) async {
    var id = await notificationRepository.insertInDbType(
      notificationData,
      mode: null,
    );
    assert(id > 0, true);
    var dbNotification = notificationData.copyWith(id: id);

    return dbNotification;
  }
}
