import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_page_app_bar_body_widget.dart';
import 'package:fedi/app/chat/pleroma/accounts/pleroma_chat_accounts_page.dart';
import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_widget.dart';
import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc_impl.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PleromaChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FediDarkStatusBarStyleArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const _PleromaChatPageAppBarWidget(),
              const Expanded(
                child: PleromaChatWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  const PleromaChatPage();
}

class _PleromaChatPageAppBarWidget extends StatelessWidget {
  const _PleromaChatPageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPageCustomAppBar(
      leading: FediBackIconButton(),
      child: InkWell(
        onTap: () {
          var chatBloc = IPleromaChatBloc.of(context, listen: false);

          goToPleromaChatAccountsPage(
            context,
            chat: chatBloc.chat,
          );
        },
        child: const ChatPageAppBarBodyWidget(),
      ),
    );
  }
}

void goToPleromaChatPage(
  BuildContext context, {
  required IPleromaChat chat,
}) {
  Navigator.push(
    context,
    createPleromaChatPageRoute(chat),
  );
}

MaterialPageRoute createPleromaChatPageRoute(IPleromaChat chat) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IPleromaChatBloc>(
      create: (context) {
        var chatBloc = PleromaChatBloc.createFromContext(
          context,
          chat: chat,
          lastChatMessage: null,
        );

        // we don't need to await
        chatBloc.markAsRead();

        var currentChatBloc =
            IPleromaChatCurrentBloc.of(context, listen: false);

        currentChatBloc.onChatOpened(chat);

        chatBloc.addDisposable(
          disposable: CustomDisposable(
            () async {
              currentChatBloc.onChatClosed(chat);
            },
          ),
        );

        return chatBloc;
      },
      child: PleromaChatPostMessageBloc.provideToContext(
        context,
        chatRemoteId: chat.remoteId,
        child: ProxyProvider<IPleromaChatBloc, IChatBloc>(
          update: (context, value, _) => value,
          child: ChatSelectionBloc.provideToContext(
            context,
            child: const PleromaChatPage(),
          ),
        ),
      ),
    ),
  );
}
