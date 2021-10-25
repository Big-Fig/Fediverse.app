import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/toast/toast_service_impl.dart';
import 'package:fedi_app/overlay_notification/overlay_notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ToastServiceProvider extends StatelessWidget {
  final Widget child;

  const ToastServiceProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

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
