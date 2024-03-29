import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/chat_bloc.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTitleWidget extends StatelessWidget {
  final TextStyle? textStyle;

  const ChatTitleWidget({
    Key? key,
    this.textStyle,
  }) : super(key: key);

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
          return const SizedBox.shrink();
        }
        var accountsText = accounts!.map((account) => account.acct).join(', ');

        return Text(
          accountsText,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        );
      },
    );
  }
}
