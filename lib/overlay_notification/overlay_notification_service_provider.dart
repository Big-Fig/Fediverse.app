import 'package:fedi/overlay_notification/overlay_notification_service.dart';
import 'package:fedi/overlay_notification/overlay_notification_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class OverlayNotificationServiceProvider extends StatelessWidget {
  final Widget child;

  const OverlayNotificationServiceProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: Provider<IOverlayNotificationService>(
        create: (context) => OverlayNotificationService(),
        child: child,
      ),
    );
  }
}
