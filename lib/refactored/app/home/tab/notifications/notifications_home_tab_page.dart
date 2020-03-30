import 'package:fedi/Pages/Notifications/NotificationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsHomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationPage(
      key: GlobalKey(),
    ));
  }
}
