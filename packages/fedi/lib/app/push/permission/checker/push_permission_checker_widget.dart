import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/push/permission/ask/ask_push_permission_dialog.dart';
import 'package:fedi/app/push/permission/checker/push_permission_checker_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger('push_permission_checker_widget.dart');

class PushPermissionCheckerWidget extends StatefulWidget {
  final Widget child;

  const PushPermissionCheckerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  PushPermissionCheckerWidgetState createState() =>
      PushPermissionCheckerWidgetState();
}

class PushPermissionCheckerWidgetState
    extends State<PushPermissionCheckerWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    checkPushPermission();
  }

  Future<void> checkPushPermission() async {
    var configService = IConfigService.of(context, listen: false);

    if (configService.pushFcmEnabled) {
      var pushPermissionCheckerBloc =
          IPushPermissionCheckerBloc.of(context, listen: false);

      var isNeedCheckPermission =
          pushPermissionCheckerBloc.isNeedCheckPermission;
      _logger.finest(() => 'isNeedCheckPermission $isNeedCheckPermission');

      if (isNeedCheckPermission) {
        // todo: refactor
        // ignore: no-magic-number
        Future.delayed(
          // todo: refactor
          // ignore: no-magic-number
          const Duration(milliseconds: 100),
          () async {
            await showAskPushPermissionDialog(
              context: context,
              pushPermissionCheckerBloc: pushPermissionCheckerBloc,
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
