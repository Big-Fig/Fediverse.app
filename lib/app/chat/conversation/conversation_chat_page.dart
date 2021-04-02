import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_page_app_bar_body_widget.dart';
import 'package:fedi/app/chat/conversation/accounts/conversation_chat_accounts_page.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_widget.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/post/conversation_chat_post_message_bloc_impl.dart';
import 'package:fedi/app/chat/selection/chat_page_selection_app_bar_widget.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FediDarkStatusBarStyleArea(
      child: Scaffold(
        appBar: _ConversationChatPageAppBarWidget(),
        body: const ConversationChatWidget(),
      ),
    );
  }

  const ConversationChatPage();
}

class _ConversationChatPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _ConversationChatPageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatPageSelectionAppBarWidget(
      emptySelectionAppBar: FediPageCustomAppBar(
        leading: const FediBackIconButton(),
        child: InkWell(
          onTap: () {
            var chatBloc = IConversationChatBloc.of(context, listen: false);

            goToConversationChatAccountsPage(context, chatBloc.chat);
          },
          child: const ChatPageAppBarBodyWidget(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => FediPageCustomAppBar.calculatePreferredSize();
}

void goToConversationChatPage(
  BuildContext context, {
  required IConversationChat chat,
  required IConversationChatMessage? lastChatMessage,
  required VoidCallback? onDeletedCallback,
}) {
  Navigator.push(
    context,
    createConversationChatPageRoute(
      chat: chat,
      lastChatMessage: lastChatMessage,
      onDeletedCallback: onDeletedCallback,
    ),
  );
}

MaterialPageRoute createConversationChatPageRoute({
  required IConversationChat chat,
  required IConversationChatMessage? lastChatMessage,
  required VoidCallback? onDeletedCallback,
}) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IConversationChatBloc>(
      create: (context) {
        var chatBloc = ConversationChatBloc.createFromContext(
          context,
          chat: chat,
          lastChatMessage: lastChatMessage,
        );

        // we don't need to await
        chatBloc.markAsRead();

        chatBloc.addDisposable(
          streamSubscription: chatBloc.chatDeletedStream.listen(
            (_) {
              if (onDeletedCallback != null) {
                onDeletedCallback();
              }
            },
          ),
        );

        var currentChatBloc =
            IConversationChatCurrentBloc.of(context, listen: false);

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
      child: ConversationChatPostMessageBloc.provideToContext(
        context,
        conversation: chat,
        child: ProxyProvider<IConversationChatBloc, IChatBloc>(
          update: (context, value, _) => value,
          child: ChatSelectionBloc.provideToContext(
            context,
            child: const ConversationChatPage(),
          ),
        ),
      ),
    ),
  );
}
