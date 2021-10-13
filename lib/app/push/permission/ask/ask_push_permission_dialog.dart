import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/push/permission/checker/push_permission_checker_bloc.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

Future<void> showAskPushPermissionDialog({
  required BuildContext context,
  required IPushPermissionCheckerBloc pushPermissionCheckerBloc,
}) =>
    showFediChooserDialog(
      context: context,
      title: S.of(context).app_push_permission_ask_dialog_title,
      content: S.of(context).app_push_permission_ask_dialog_content,
      actions: [
        DialogAction(
          label: S.of(context).dialog_action_yes,
          onAction: (BuildContext context) async {
            Navigator.of(context).pop();
            var success = await pushPermissionCheckerBloc.checkAndSubscribe();
            if (!success) {
              _showPermissionNotGrantedDialog(context);
            }
          },
        ),
        DialogAction(
          label: S.of(context).dialog_action_learnMore,
          onAction: (BuildContext context) async {
            await UrlHelper.handleUrlClick(
              context: context,
              url: IConfigService.of(
                context,
                listen: false,
              ).pushDetailsUrl!,
            );
          },
        ),
        DialogAction(
          label: S.of(context).dialog_action_no,
          onAction: (BuildContext context) async {
            Navigator.of(context).pop();
            await pushPermissionCheckerBloc.onCheckDismissed();
            _showPermissionNotGrantedDialog(context);
          },
        ),
      ],
      cancelable: false,
    );

void _showPermissionNotGrantedDialog(BuildContext context) {
  Future.delayed(
    // todo: refactor
    // ignore: no-magic-number
    Duration(milliseconds: 100),
    () {
      var declinedPushPermissionDialog =
          _createDeclinedPushPermissionDialog(context: context);

      // ignore: cascade_invocations
      declinedPushPermissionDialog.show<void>(context);
    },
  );
}

FediBaseAlertDialog _createDeclinedPushPermissionDialog({
  required BuildContext context,
  DialogActionCallback? action,
}) =>
    FediSimpleAlertDialog(
      title: S.of(context).app_push_permission_declined_dialog_title,
      contentText: S.of(context).app_push_permission_declined_dialog_content,
      action: action,
    );
