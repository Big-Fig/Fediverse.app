import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/toast/toast_model.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/toast/toast_widget.dart';
import 'package:fedi_app/overlay_notification/overlay_notification_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('toast_service_impl.dart');

class ToastService extends DisposableOwner implements IToastService {
  final IOverlayNotificationService overlayNotificationService;

  ToastService({
    required this.overlayNotificationService,
  });

  @override
  void showErrorToast({
    required BuildContext? context,
    required String title,
    bool titleAutoFontSize = true,
    String? content,
    VoidCallback? onClick,
    Duration duration = const Duration(seconds: 2, milliseconds: 500),
  }) {
    _logger.warning(() => 'showErrorToast $title, $content');
    overlayNotificationService.showNotification(
      child: ToastWidget(
        toastType: ToastType.error,
        title: title,
        content: content,
        titleAutoFontSize: titleAutoFontSize,
        onClick: onClick,
      ),
      key: ValueKey(title),
      duration: duration,
    );
  }

  @override
  void showInfoToast({
    required BuildContext context,
    required String title,
    bool titleAutoFontSize = true,
    String? content,
    VoidCallback? onClick,
    Duration duration = const Duration(seconds: 2, milliseconds: 500),
  }) {
    _logger.finest(() => 'showInfoToast $title, $content');
    overlayNotificationService.showNotification(
      child: ToastWidget(
        toastType: ToastType.info,
        title: title,
        content: content,
        titleAutoFontSize: titleAutoFontSize,
        onClick: onClick,
      ),
      key: ValueKey(title),
      duration: duration,
    );
  }
}
