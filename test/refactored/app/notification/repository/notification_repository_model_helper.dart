import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbNotification> insertDbNotification(
  NotificationRepository notificationRepository,
  DbNotification notificationData,
) async {
  var id = await notificationRepository.insert(notificationData);
  assert(id != null, true);
  var dbNotification = notificationData.copyWith(id: id);
  return dbNotification;
}
