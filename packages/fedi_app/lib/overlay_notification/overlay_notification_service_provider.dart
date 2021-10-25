import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/overlay_notification/overlay_notification_service.dart';
import 'package:fedi_app/overlay_notification/overlay_notification_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';

class OverlayNotificationServiceProvider extends StatelessWidget {
  final Widget child;

  const OverlayNotificationServiceProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OverlaySupport(
        child: DisposableProvider<IOverlayNotificationService>(
          create: (context) => OverlayNotificationService(),
          child: child,
        ),
      );
}
