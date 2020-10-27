import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/conversation/share/conversation_share_media_bloc_impl.dart';
import 'package:fedi/app/share/media/share_media_with_message_widget.dart';
import 'package:fedi/app/share/select/share_select_account_widget.dart';
import 'package:fedi/app/share/to_account/share_to_account_icon_button_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationShareMediaPage extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  ConversationShareMediaPage({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_conversation_share_title,
        actions: [
          ShareToAccountIconButtonWidget(),
        ],
      ),
      body: ShareSelectAccountWidget(
        header: ShareMediaWithMessageWidget(
          mediaAttachment: mediaAttachment,
          footer: null,
        ),
        alwaysShowHeader: true,
      ),
    );
  }
}

void goToConversationShareMediaPage(
    {@required BuildContext context,
    @required IPleromaMediaAttachment mediaAttachment}) {
  Navigator.push(
    context,
    createConversationShareMediaPageRoute(
      context: context,
      mediaAttachment: mediaAttachment,
    ),
  );
}

MaterialPageRoute createConversationShareMediaPageRoute({
  @required BuildContext context,
  @required IPleromaMediaAttachment mediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => ConversationShareMediaBloc.provideToContext(context,
        mediaAttachment: mediaAttachment,
        child: Provider.value(
          value: mediaAttachment,
          child: ConversationShareMediaPage(
            mediaAttachment: mediaAttachment,
          ),
        )),
  );
}
