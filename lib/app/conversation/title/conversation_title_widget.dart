import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/conversation/conversation_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationTitleWidget extends StatelessWidget {
  final TextStyle textStyle;

  const ConversationTitleWidget({
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: false);

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
