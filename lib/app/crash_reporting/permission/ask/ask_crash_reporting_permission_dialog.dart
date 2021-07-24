import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

Future showAskCrashReportingPermissionDialog({
  required BuildContext context,
  required ICrashReportingPermissionCheckerBloc
      crashReportingPermissionCheckerBloc,
}) {
  return showFediChooserDialog(
    context: context,
    title: S.of(context).app_crashReporting_ask_dialog_title,
    content: S.of(context).app_crashReporting_ask_dialog_content,
    actions: [
      DialogAction(
        label: S.of(context).dialog_action_yes,
        onAction: (BuildContext context) async {
          Navigator.of(context).pop();
          await crashReportingPermissionCheckerBloc.onUserAnswer(true);
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
            ).crashlyticsDetailsUrl!,
          );
        },
      ),
      DialogAction(
        label: S.of(context).dialog_action_no,
        onAction: (BuildContext context) async {
          Navigator.of(context).pop();
          await crashReportingPermissionCheckerBloc.onUserAnswer(false);
        },
      ),
    ],
    cancelable: false,
  );
}
