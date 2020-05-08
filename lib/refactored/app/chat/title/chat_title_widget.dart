import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/chat/chat_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: false);

    return StreamBuilder<List<IAccount>>(
        stream: chatBloc.accountsWithoutMeStream,
        builder: (context, snapshot) {
          var accounts = snapshot.data;

          if (accounts?.isNotEmpty != true) {
            return SizedBox.shrink();
          }
          return Row(
            children: <Widget>[
              Text(
                accounts.map((account) => account.acct).join(", "),
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
        });
  }
}
