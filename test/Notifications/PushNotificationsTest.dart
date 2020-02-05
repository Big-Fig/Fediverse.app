import 'package:fedi/Notifications/PushNotification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var notificationType = "notificationType";
  var notificationId = 1;
  var server = "server";
  var account = "account";
  test('fromJson', () {
    var notification = PushNotification.fromJson({
      "notification_type": notificationType,
      "notification_id": notificationId,
      "server": server,
      "account": account,
    });

    expect(notification.notificationType, notificationType);
    expect(notification.notificationId, notificationId);
    expect(notification.server, server);
    expect(notification.account, account);
  });

  test('toJson', () {
    PushNotification(
        notificationType: notificationType,
        notificationId: notificationId,
        server: server,
        account: account);
    var notification = PushNotification.fromJson({
      "notification_type": notificationType,
      "notification_id": notificationId,
      "server": server,
      "account": account,
    });

    var json = notification.toJson();

    expect(json["notification_type"], notificationType);
    expect(json["notification_id"], notificationId);
    expect(json["server"], server);
    expect(json["account"], account);
  });
}
