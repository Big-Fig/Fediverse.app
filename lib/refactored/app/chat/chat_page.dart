import 'package:fedi/refactored/app/chat/accounts/chat_accounts_page.dart';
import 'package:fedi/refactored/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/refactored/app/chat/chat_bloc.dart';
import 'package:fedi/refactored/app/chat/chat_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/chat_widget.dart';
import 'package:fedi/refactored/app/chat/current/current_chat_bloc.dart';
import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/title/chat_title_widget.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: GestureDetector(
          onTap: () {
            goToChatAccountsPage(context, chatBloc.chat);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ChatAvatarWidget(baseAvatarSize: 40),
              SizedBox(
                width: 8,
              ),
              ChatTitleWidget(),
            ],
          ),
        ),
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: ChatWidget(),
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
