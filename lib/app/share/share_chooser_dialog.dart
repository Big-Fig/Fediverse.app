import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

void showShareChooserDialog(
  BuildContext context, {
  @required VoidCallback externalShareAction,
  @required VoidCallback conversationsShareAction,
  @required VoidCallback chatsShareAction,
}) {
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  showFediChooserDialog(
      context: context,
      title: "app.share.title".tr(),
      actions: [
        DialogAction(
            icon: FediIcons.share,
            label: tr("app.share.action.share_to_external"),
            onAction: () {
              externalShareAction();
            }),
        DialogAction(
          icon: FediIcons.share,
          label: tr("app.share.action.share_to_conversations"),
          onAction: () {
            conversationsShareAction();
          },
        ),
        if (currentAuthInstanceBloc.currentInstance.isSupportChats)
          DialogAction(
            icon: FediIcons.share,
            label: tr("app.share.action.share_to_chats"),
            onAction: () {
              chatsShareAction();
            },
          ),
      ]);
}
