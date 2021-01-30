import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

void showShareChooserDialog(
  BuildContext context, {
  @required VoidCallback externalShareAction,
  @required VoidCallback conversationsShareAction,
  @required VoidCallback chatsShareAction,
  @required VoidCallback newStatusShareAction,
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
          externalShareAction();
        },
      ),
      DialogAction(
        icon: FediIcons.envelope,
        label: S.of(context).app_share_action_shareToConversations,
        onAction: (context) {
          conversationsShareAction();
        },
      ),

      if (currentAuthInstanceBloc.currentInstance.isSupportChats)
        DialogAction(
          icon: FediIcons.chat,
          label: S.of(context).app_share_action_shareToChats,
          onAction: (context) {
            chatsShareAction();
          },
        ),
      DialogAction(
        icon: FediIcons.send,
        label: S.of(context).app_share_action_shareToNewStatus,
        onAction: (context) {
          newStatusShareAction();
        },
      ),
    ],
  );
}
