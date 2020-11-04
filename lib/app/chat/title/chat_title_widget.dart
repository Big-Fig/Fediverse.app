import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTitleWidget extends StatelessWidget {
  final TextStyle textStyle;

  const ChatTitleWidget({
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).bigShortBoldDarkGrey;

    var chatBloc = IChatBloc.of(context);

    return StreamBuilder<List<IAccount>>(
        stream: chatBloc.accountsStream,
        builder: (context, snapshot) {
          var accounts = snapshot.data;

          if (accounts?.isNotEmpty != true) {
            return SizedBox.shrink();
          }
          var accountsText = accounts.map((account) => account.acct).join(", ");
          return StreamBuilder<int>(
              stream: chatBloc.unreadCountStream,
              initialData: chatBloc.unreadCount,
              builder: (context, snapshot) {
                var unreadCount = snapshot.data;

                var finalText;

                if (unreadCount > 0) {
                  finalText = "$accountsText ($unreadCount)";
                } else {
                  finalText = accountsText;
                }

                return Text(
                  finalText,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                );
              });
        });
  }
}
