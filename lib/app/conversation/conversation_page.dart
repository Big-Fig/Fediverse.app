import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/conversation/accounts/conversation_accounts_page.dart';
import 'package:fedi/app/conversation/avatar/conversation_avatar_widget.dart';
import 'package:fedi/app/conversation/conversation_bloc.dart';
import 'package:fedi/app/conversation/conversation_bloc_impl.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/conversation/conversation_widget.dart';
import 'package:fedi/app/conversation/status/post/conversation_post_status_bloc_impl.dart';
import 'package:fedi/app/conversation/title/conversation_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: false);

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
              Expanded(child: ConversationWidget())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConversationAccountsWidget(
      BuildContext context, IConversationBloc conversationBloc) {
    return InkWell(
      onTap: () {
        goToConversationAccountsPage(context, conversationBloc.conversation);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ConversationAvatarWidget(baseAvatarSize: 36),
          const FediSmallHorizontalSpacer(),
           ConversationTitleWidget(
            textStyle: IFediUiTextTheme.of(context).bigShortBoldDarkGrey,
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
            child: ConversationPostStatusBloc.provideToContext(
              context,
              conversationAccountsWithoutMe: conversationAccountsWithoutMe,
              child: ConversationPage(),
              conversation: conversation,
            ))),
  );
}
