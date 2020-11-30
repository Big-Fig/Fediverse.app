import 'package:fedi/app/settings/settings_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalSettingsDialog({
  @required BuildContext context,
  @required String subTitle,
  StringBuilderFromContext subTitleBuilder,
  @required Widget child,
}) {
  showSettingsDialog(
    context: context,
    title: null,
    titleBuilder: (context) => S.of(context).app_settings_global_title,
    subTitleBuilder: subTitleBuilder,
    subTitle: subTitle,
    child: child,
  );
}
