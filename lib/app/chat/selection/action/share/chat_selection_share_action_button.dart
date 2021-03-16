import 'package:fedi/app/chat/conversation/share/conversation_chat_share_status_page.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_status_page.dart';
import 'package:fedi/app/chat/selection/action/share/chat_selection_share_action_model.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/share/external/external_share_status_page.dart';
import 'package:fedi/app/share/share_chooser_dialog.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class ChatSelectionShareActionButtonWidget extends StatelessWidget {
  const ChatSelectionShareActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceLocation = InstanceLocation.local;
    return FediIconButton(
      icon: Icon(FediIcons.share),
      color: IFediUiColorTheme.of(context).darkGrey,
      onPressed: () async {
        var chatSelectionBloc = IChatSelectionBloc.of(context, listen: false);

        var rawText = chatSelectionBloc.calculateSelectionAsRawText();

        // todo: remove hack
        // need rework to separate page for simple raw text share
        var status = ChatSelectionShareActionStatusAdapter(
          content: rawText,
          account: chatSelectionBloc.currentSelection!.first.account,
          visibility: PleromaVisibility.public,
        );

        showShareChooserDialog(
          context,
          externalShareAction: (context) {
            Navigator.of(context).pop();
            goToExternalShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
              isShareAsLinkPossible: false,
            );
          },
          conversationsShareAction: (context) {
            Navigator.of(context).pop();
            goToConversationShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
            );
          },
          chatsShareAction: (context) {
            Navigator.of(context).pop();
            goToPleromaChatShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
            );
          },
          newStatusShareAction: (context) {
            Navigator.of(context).pop();
            goToNewPostStatusPageWithInitial(
              context,
              initialText: rawText,
            );
          },
        );

        chatSelectionBloc.clearSelection();
      },
    );
  }
}
