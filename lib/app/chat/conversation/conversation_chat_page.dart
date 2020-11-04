import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/conversation/accounts/conversation_chat_accounts_page.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_widget.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi/app/chat/conversation/post/conversation_chat_post_message_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
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
        body: SafeArea(
          child: Column(
            children: [
              const _ConversationChatPageAppBarWidget(),
              const Expanded(
                child: ConversationChatWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  const ConversationChatPage();
}

class _ConversationChatPageAppBarWidget extends StatelessWidget {
  const _ConversationChatPageAppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediSubPageCustomAppBar(
      leading: FediBackIconButton(),
      child: InkWell(
        onTap: () {
          var chatBloc = IConversationChatBloc.of(context, listen: false);

          goToConversationChatAccountsPage(context, chatBloc.chat);
        },
        child: const ChatPageAppBarBodyWidget(),
      ),
    );
  }
}

void goToConversationChatPage(BuildContext context,
    {@required IConversationChat chat}) {
  Navigator.push(
    context,
    createConversationChatPageRoute(chat),
  );
}

MaterialPageRoute createConversationChatPageRoute(IConversationChat chat) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IConversationChatBloc>(
      create: (context) {
        var chatBloc = ConversationChatBloc.createFromContext(context,
            chat: chat, lastChatMessage: null);

        // we don't need to await
        chatBloc.markAsRead();

        var currentChatBloc =
            IConversationChatCurrentBloc.of(context, listen: false);

        currentChatBloc.onChatOpened(chat);

        chatBloc.addDisposable(disposable: CustomDisposable(() async {
          currentChatBloc.onChatClosed(chat);
        }));

        return chatBloc;
      },
      child: ConversationChatPostMessageBloc.provideToContext(
        context,
        conversation: chat,
        child: ProxyProvider<IConversationChatBloc, IChatBloc>(
          update: (context, value, _) => value,
          child: const ConversationChatPage(),
        ), conversationAccountsWithoutMe: null,
      ),
    ),
  );
}

//
// class ConversationChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var conversationBloc = IConversationChatBloc.of(context, listen: false);
//
//     var fediUiColorTheme = IFediUiColorTheme.of(context);
//     return FediDarkStatusBarStyleArea(
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Container(
//                 height: 56,
//                 decoration: BoxDecoration(
//                   color: fediUiColorTheme.white,
//                   boxShadow: [FediShadows.forTopBar],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     FediBackIconButton(),
//                     buildConversationAccountsWidget(context, conversationBloc)
//                   ],
//                 ),
//               ),
//               Expanded(child: ConversationChatWidget())
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildConversationAccountsWidget(
//       BuildContext context, IConversationChatBloc conversationBloc) {
//     return InkWell(
//       onTap: () {
//         goToConversationChatAccountsPage(context, conversationBloc.conversation);
//       },
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           const ChatAvatarWidget(baseAvatarSize: 36),
//           const FediSmallHorizontalSpacer(),
//           ConversationChatTitleWidget(
//             textStyle: IFediUiTextTheme.of(context).bigShortBoldDarkGrey,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // todo: conversationAccountsWithoutMe should be removed and dynamically load
// void goToConversationChatPage(BuildContext context,
//     {@required IConversationChat conversation,
//       @required List<IAccount> conversationAccountsWithoutMe}) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//         builder: (context) => DisposableProvider<IConversationChatBloc>(
//             create: (context) {
//               var conversationBloc = ConversationChatBloc.createFromContext(context,
//                   conversation: conversation);
//               return conversationBloc;
//             },
//             child: ConversationChatPostStatusBloc.provideToContext(
//               context,
//               conversationAccountsWithoutMe: conversationAccountsWithoutMe,
//               child: ConversationChatPage(),
//               conversation: conversation,
//             ))),
//   );
// }
