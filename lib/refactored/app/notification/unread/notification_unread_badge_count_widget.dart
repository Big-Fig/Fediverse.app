import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class NotificationUnreadBadgeCountWidget extends StatelessWidget {
  final Widget child;

  NotificationUnreadBadgeCountWidget({@required this.child});

  Stream<int> retrieveUnreadBadgeCountStream(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: retrieveUnreadBadgeCountStream(context).distinct(),
        builder: (context, snapshot) {
          var unreadCount = snapshot.data;

          if (unreadCount == null || unreadCount == 0) {
            return child;
          }
          return Badge(
            shape: BadgeShape.circle,
            borderRadius: 100,
            child: child,
            badgeContent: Text(
              unreadCount.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
