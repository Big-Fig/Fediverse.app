import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_media_bloc_impl.dart';
import 'package:fedi/app/share/media/share_media_with_message_widget.dart';
import 'package:fedi/app/share/select_account/share_select_account_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PleromaChatShareMediaPage extends StatelessWidget {
  const PleromaChatShareMediaPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_chat_pleroma_share_title,
      ),
      body: const ShareSelectAccountWidget(
        header: ShareMediaWithMessageWidget(
          footer: null,
        ),
        alwaysShowHeader: true,
      ),
    );
  }
}

void goToPleromaChatShareMediaPage({
  required BuildContext context,
  required IPleromaMediaAttachment mediaAttachment,
}) {
  Navigator.push(
    context,
    createPleromaChatShareMediaPageRoute(
      context: context,
      mediaAttachment: mediaAttachment,
    ),
  );
}

MaterialPageRoute createPleromaChatShareMediaPageRoute({
  required BuildContext context,
  required IPleromaMediaAttachment mediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => PleromaChatShareMediaBloc.provideToContext(
      context,
      mediaAttachment: mediaAttachment,
      child: Provider<IPleromaMediaAttachment>.value(
        value: mediaAttachment,
        child: const PleromaChatShareMediaPage(),
      ),
    ),
  );
}
