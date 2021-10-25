import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/chat/chat_bloc.dart';
import 'package:fedi_app/app/chat/chat_page_app_bar_body_widget.dart';
import 'package:fedi_app/app/chat/conversation/accounts/conversation_chat_accounts_page.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_widget.dart';
import 'package:fedi_app/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi_app/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi_app/app/chat/conversation/post/conversation_chat_post_message_bloc_impl.dart';
import 'package:fedi_app/app/chat/selection/chat_page_selection_app_bar_widget.dart';
import 'package:fedi_app/app/chat/selection/chat_selection_bloc_impl.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi_app/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationChatPage extends StatelessWidget {
  const ConversationChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FediDarkStatusBarStyleArea(
        child: Scaffold(
          appBar: _ConversationChatPageAppBarWidget(),
          body: ConversationChatWidget(),
        ),
      );
}

class _ConversationChatPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _ConversationChatPageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ChatPageSelectionAppBarWidget(
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

MaterialPageRoute<void> createConversationChatPageRoute({
  required IConversationChat chat,
  required IConversationChatMessage? lastChatMessage,
  required VoidCallback? onDeletedCallback,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => DisposableProvider<IConversationChatBloc>(
        create: (context) {
          var chatBloc = ConversationChatBloc.createFromContext(
            context,
            chat: chat,
            lastChatMessage: lastChatMessage,
          );

          // we dont need to await
          // ignore: cascade_invocations
          chatBloc.markAsRead();

          chatBloc.chatDeletedStream.listen(
            (_) {
              if (onDeletedCallback != null) {
                onDeletedCallback();
              }
            },
          ).disposeWith(chatBloc);

          var currentChatBloc =
              IConversationChatCurrentBloc.of(context, listen: false);

          // ignore: cascade_invocations
          currentChatBloc.onChatOpened(chat);

          chatBloc.addCustomDisposable(
            () => currentChatBloc.onChatClosed(chat),
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
