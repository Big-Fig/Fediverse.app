import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/database/account_database_model_helper.dart';
import '../../account/repository/account_repository_model_helper.dart';
import '../../status/database/status_database_model_helper.dart';
import '../../status/repository/status_repository_model_helper.dart';



Future<DbNotification> insertDbNotification(
  NotificationRepository notificationRepository,
  DbNotification notificationData,
) async {
  var id = await notificationRepository.insert(notificationData);
  assert(id != null, true);
  var dbNotification = notificationData.copyWith(id: id);
  return dbNotification;
}
