import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

void showShareChooserDialog(
  BuildContext context, {
  required Function(BuildContext context) externalShareAction,
  required Function(BuildContext context) conversationsShareAction,
  required Function(BuildContext context) chatsShareAction,
  required Function(BuildContext context) newStatusShareAction,
}) {
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  showFediChooserDialog(
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
      DialogAction(
        icon: FediIcons.envelope,
        label: S.of(context).app_share_action_shareToConversations,
        onAction: (context) {
          conversationsShareAction(context);
        },
      ),
      if (currentAuthInstanceBloc.currentInstance!.isSupportChats)
        DialogAction(
          icon: FediIcons.chat,
          label: S.of(context).app_share_action_shareToChats,
          onAction: (context) {
            chatsShareAction(context);
          },
        ),
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
