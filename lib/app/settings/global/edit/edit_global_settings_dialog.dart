import 'package:fedi/app/settings/settings_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalSettingsDialog({
  @required BuildContext context,
  @required String subTitle,
  @required Widget child,
}) {
  showSettingsDialog(
    context: context,
    title: S.of(context).app_settings_global_title,
    subTitle: subTitle,
    child: child,
  );
}
