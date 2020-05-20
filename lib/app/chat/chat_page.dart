import 'package:fedi/app/chat/accounts/chat_accounts_page.dart';
import 'package:fedi/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/chat_widget.dart';
import 'package:fedi/app/chat/current/current_chat_bloc.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc_impl.dart';
import 'package:fedi/app/chat/title/chat_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: false);

    return Scaffold(
      body: FediHomeTabContainer.createLikeAppBar(
        leading: FediBackIconInCircleTransparentButton(),
        center: buildChatAccountsWidget(context, chatBloc),
        trailing: null,
        body: ChatWidget(),
      ),
    );
  }

  GestureDetector buildChatAccountsWidget(
      BuildContext context, IChatBloc chatBloc) {
    return GestureDetector(
      onTap: () {
        goToChatAccountsPage(context, chatBloc.chat);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ChatAvatarWidget(baseAvatarSize: 40),
          const SizedBox(
            width: 8,
          ),
          const ChatTitleWidget(
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: FediColors.white),
          ),
        ],
      ),
    );
  }
}

void goToChatPage(BuildContext context, {@required IChat chat}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IChatBloc>(
            create: (context) {
              var chatBloc = ChatBloc.createFromContext(context, chat: chat);

              // we don't need to await
              chatBloc.markAsRead();

              var currentChatBloc = ICurrentChatBloc.of(context, listen: false);

              currentChatBloc.onChatOpened(chat);

              chatBloc.addDisposable(disposable: CustomDisposable(() {
                currentChatBloc.onChatClosed(chat);
              }));

              return chatBloc;
            },
            child: DisposableProvider<IChatPostMessageBloc>(
                create: (context) {
                  return ChatPostMessageBloc.createFromContext(context,
                      chatRemoteId: chat.remoteId);
                },
                child: ChatPage()))),
  );
}
