import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc.dart';
import 'package:fedi_app/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi_app/app/url/url_helper.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

Future<void> showAskCrashReportingPermissionDialog({
  required BuildContext context,
  required ICrashReportingPermissionCheckerBloc checkerBloc,
}) =>
    showFediChooserDialog(
      context: context,
      title: S.of(context).app_crashReporting_ask_dialog_title,
      content: S.of(context).app_crashReporting_ask_dialog_content,
      actions: [
        DialogAction(
          label: S.of(context).dialog_action_yes,
          onAction: (BuildContext context) async {
            Navigator.of(context).pop();
            await checkerBloc.onUserAnswer(
              reportingEnabled: true,
            );
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
            await checkerBloc.onUserAnswer(
              reportingEnabled: false,
            );
          },
        ),
      ],
      cancelable: false,
    );
