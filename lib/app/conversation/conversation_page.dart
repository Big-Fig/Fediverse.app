import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/conversation/accounts/conversation_accounts_page.dart';
import 'package:fedi/app/conversation/avatar/conversation_avatar_widget.dart';
import 'package:fedi/app/conversation/conversation_bloc.dart';
import 'package:fedi/app/conversation/conversation_bloc_impl.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/conversation/conversation_widget.dart';
import 'package:fedi/app/conversation/status/post/conversation_post_status_bloc_impl.dart';
import 'package:fedi/app/conversation/title/conversation_title_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: false);
    return Scaffold(
      body: FediHomeTabContainer.createLikeAppBar(
          leading: FediBackIconInCircleTransparentButton(),
          center: buildConversationAccountsWidget(context, conversationBloc),
          trailing: null,
          body: ConversationWidget()),
    );
  }

  GestureDetector buildConversationAccountsWidget(
      BuildContext context, IConversationBloc conversationBloc) {
    return GestureDetector(
      onTap: () {
        goToConversationAccountsPage(context, conversationBloc.conversation);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ConversationAvatarWidget(baseAvatarSize: 40),
          const SizedBox(
            width: 8,
          ),
          const ConversationTitleWidget(
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

// todo: conversationAccountsWithoutMe should be removed and dynamically load
void goToConversationPage(BuildContext context,
    {@required IConversation conversation,
    @required List<IAccount> conversationAccountsWithoutMe}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IConversationBloc>(
            create: (context) {
              var conversationBloc = ConversationBloc.createFromContext(context,
                  conversation: conversation);
              return conversationBloc;
            },
            child: DisposableProvider<IPostStatusBloc>(
                create: (context) {
                  return ConversationPostStatusBloc.createFromContext(context,
                      conversation: conversation,
                      conversationAccountsWithoutMe:
                          conversationAccountsWithoutMe);
                },
                child: ConversationPage()))),
  );
}
