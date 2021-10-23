import 'dart:async';

import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

Future<void> showShareChooserDialog(
  BuildContext context, {
  required FutureOr<void> Function(BuildContext context) externalShareAction,
  required FutureOr<void> Function(BuildContext context)
      conversationsShareAction,
  required FutureOr<void> Function(BuildContext context) chatsShareAction,
  required FutureOr<void> Function(BuildContext context) newStatusShareAction,
}) async {
  var currentUnifediApiAccessBloc =
      ICurrentUnifediApiAccessBloc.of(context, listen: false);

  var currentInstance = currentUnifediApiAccessBloc.currentInstance;
  await showFediChooserDialog<void>(
    context: context,
    title: S.of(context).app_share_title,
    actions: [
      DialogAction(
        icon: FediIcons.share_native,
        label: S.of(context).app_share_action_shareToExternal,
        onAction: (context) {
          externalShareAction(context);
        },
      ),
      if (currentInstance != null)
        DialogAction(
          icon: FediIcons.envelope,
          label: S.of(context).app_share_action_shareToConversations,
          onAction: (context) {
            conversationsShareAction(context);
          },
        ),
      if (currentInstance != null && currentUnifediApiAccessBloc.isSupportChats)
        DialogAction(
          icon: FediIcons.chat,
          label: S.of(context).app_share_action_shareToChats,
          onAction: (context) {
            chatsShareAction(context);
          },
        ),
      if (currentInstance != null)
        DialogAction(
          icon: FediIcons.send,
          label: S.of(context).app_share_action_shareToNewStatus,
          onAction: (context) {
            newStatusShareAction(context);
          },
        ),
    ],
  );
}
