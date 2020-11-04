import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/accounts/conversation_chat_accounts_page.dart';
import 'package:fedi/app/chat/conversation/avatar/conversation_chat_avatar_widget.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_widget.dart';
import 'package:fedi/app/chat/conversation/status/post/conversation_chat_post_status_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/title/conversation_chat_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConversationChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationChatBloc.of(context, listen: false);

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return FediDarkStatusBarStyleArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: fediUiColorTheme.white,
                  boxShadow: [FediShadows.forTopBar],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FediBackIconButton(),
                    buildConversationAccountsWidget(context, conversationBloc)
                  ],
                ),
              ),
              Expanded(child: ConversationChatWidget())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConversationAccountsWidget(
      BuildContext context, IConversationChatBloc conversationBloc) {
    return InkWell(
      onTap: () {
        goToConversationChatAccountsPage(context, conversationBloc.conversation);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ConversationChatAvatarWidget(baseAvatarSize: 36),
          const FediSmallHorizontalSpacer(),
           ConversationChatTitleWidget(
            textStyle: IFediUiTextTheme.of(context).bigShortBoldDarkGrey,
          ),
        ],
      ),
    );
  }
}

// todo: conversationAccountsWithoutMe should be removed and dynamically load
void goToConversationChatPage(BuildContext context,
    {@required IConversationChat conversation,
    @required List<IAccount> conversationAccountsWithoutMe}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IConversationChatBloc>(
            create: (context) {
              var conversationBloc = ConversationChatBloc.createFromContext(context,
                  conversation: conversation);
              return conversationBloc;
            },
            child: ConversationChatPostStatusBloc.provideToContext(
              context,
              conversationAccountsWithoutMe: conversationAccountsWithoutMe,
              child: ConversationChatPage(),
              conversation: conversation,
            ))),
  );
}
