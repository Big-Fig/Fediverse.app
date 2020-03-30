import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:flutter/cupertino.dart';

class ConversationTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: false);

    return StreamBuilder<List<IAccount>>(
        stream: conversationBloc.accountsWithoutMeStream,
        initialData: conversationBloc.accountsWithoutMe,
        builder: (context, snapshot) {
          var accounts = snapshot.data;
          if (accounts == null) {
            return SizedBox.shrink();
          }
          if (accounts.isNotEmpty != true) {
            // todoL localizations
            return Text("No accounts");
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
