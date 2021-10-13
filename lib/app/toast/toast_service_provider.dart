import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/toast/toast_service_impl.dart';
import 'package:fedi/overlay_notification/overlay_notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ToastServiceProvider extends StatelessWidget {
  final Widget child;

  ToastServiceProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Provider<IToastService>(
        create: (context) => ToastService(
          overlayNotificationService: IOverlayNotificationService.of(
            context,
            listen: false,
          ),
        ),
        child: child,
      );
}
