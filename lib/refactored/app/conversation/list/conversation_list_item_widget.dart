import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/conversation/avatar/conversation_avatar_widget.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:fedi/refactored/app/conversation/conversation_page.dart';
import 'package:fedi/refactored/app/conversation/title/conversation_title_widget.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class ConversationListItemWidget extends StatelessWidget {
  ConversationListItemWidget();

  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: true);

    return GestureDetector(
      onTap: () {
        goToConversationPage(context,
            conversation: conversationBloc.conversation,
            conversationAccountsWithoutMe: conversationBloc.accountsWithoutMe);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConversationAvatarWidget(),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: buildConversationPreview(context, conversationBloc),
                  ),
                ],
              ),
              buildGoToConversationButton(context, conversationBloc),
            ],
          ),
        ),
      ),
    );
  }

  Column buildConversationPreview(
      BuildContext context, IConversationBloc conversationBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ConversationTitleWidget(),
        buildLastStatusText(context, conversationBloc),
      ],
    );
  }

  IconButton buildGoToConversationButton(
      BuildContext context, IConversationBloc conversationBloc) {
    return IconButton(
      icon: Icon(Icons.chevron_right),
      tooltip: AppLocalizations.of(context).tr("app.conversation."
          ".action.more"),
      onPressed: () {
        goToConversationPage(context,
            conversation: conversationBloc.conversation,
            conversationAccountsWithoutMe: conversationBloc.accountsWithoutMe);
      },
    );
  }

  Widget buildLastStatusText(
      BuildContext context, IConversationBloc conversationBloc) {
    return StreamBuilder<IStatus>(
        stream: conversationBloc.lastStatusStream,
        builder: (context, snapshot) {
          var lastStatus = snapshot.data;

          if (lastStatus == null) {
            return CircularProgressIndicator();
          }
          return Text(
            extractStatusText(context, lastStatus),
            maxLines: 2,
            style: TextStyle(fontSize: 14),
          );
        });
  }

  String extractStatusText(BuildContext context, IStatus status) {
    String formattedText = parse(status.content).documentElement.text;
    for (var i = 0; i < status.mentions.length; i++) {
      var mention = status.mentions[i];
      var account = mention.acct.split("@").first;
      print(account);
      formattedText = formattedText.replaceAll("@$account", "");
    }

    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    if (myAccountBloc.checkStatusIsFromMe(status)) {
      formattedText = AppLocalizations.of(context)
          .tr("app.conversation."
          ".preview.you", args: [formattedText]);
    }
    return formattedText;
  }
}
