import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IOverlayNotificationService implements IDisposable {
  static IOverlayNotificationService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IOverlayNotificationService>(context, listen: listen);

  void showNotification({
    required Widget child,
    DismissDirection dismissDirection = DismissDirection.horizontal,
    required Key key,
    required Duration duration,
  });
}
