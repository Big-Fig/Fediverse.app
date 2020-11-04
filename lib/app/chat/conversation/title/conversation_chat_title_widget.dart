import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationChatTitleWidget extends StatelessWidget {
  final TextStyle textStyle;

  const ConversationChatTitleWidget({
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationChatBloc.of(context, listen: false);

    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).bigShortBoldDarkGrey;

    return StreamBuilder<List<IAccount>>(
        stream: conversationBloc.accountsWithoutMeStream,
        builder: (context, snapshot) {
          var accounts = snapshot.data;

          if (accounts?.isNotEmpty != true) {
            return SizedBox.shrink();
          }
          return Row(
            children: <Widget>[
              Text(
                accounts.map((account) => account.acct).join(", "),
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              ),
            ],
          );
        });
  }
}
