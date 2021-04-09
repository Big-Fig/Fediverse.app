import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbNotification> insertDbNotification(
  NotificationRepository notificationRepository,
  DbNotification notificationData,
) async {
  var id = await notificationRepository.insertInDbType(notificationData);
  assert(id > 0, true);
  var dbNotification = notificationData.copyWith(id: id);
  return dbNotification;
}
