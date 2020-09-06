import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/share/chat_share_bloc.dart';
import 'package:fedi/app/chat/share/chat_share_media_bloc_impl.dart';
import 'package:fedi/app/share/media/share_media_with_message_widget.dart';
import 'package:fedi/app/share/select/share_select_account_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatShareMediaPage extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  ChatShareMediaPage({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) {
    var chatShareBloc = IChatShareBloc.of(context, listen: false);
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.chat.share.title".tr(),
      ),
      body: ShareMediaWithMessageWidget(
        mediaAttachment: mediaAttachment,
        header: ShareSelectAccountWidget(
          customLocalAccountListLoader:
              chatShareBloc.customLocalAccountListLoader,
          customRemoteAccountListLoader:
              chatShareBloc.customRemoteAccountListLoader,
        ),
      ),
    );
  }
}

void goToChatShareMediaPage(
    {@required BuildContext context,
    @required IPleromaMediaAttachment mediaAttachment}) {
  Navigator.push(
    context,
    createChatShareMediaPageRoute(
      context: context,
      mediaAttachment: mediaAttachment,
    ),
  );
}

MaterialPageRoute createChatShareMediaPageRoute({
  @required BuildContext context,
  @required IPleromaMediaAttachment mediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => ChatShareMediaBloc.provideToContext(context,
        mediaAttachment: mediaAttachment,
        child: Provider.value(
          value: mediaAttachment,
          child: ChatShareMediaPage(
            mediaAttachment: mediaAttachment,
          ),
        )),
  );
}
