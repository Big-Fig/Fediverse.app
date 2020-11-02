import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/avatar/account_list_avatar_widget.dart';
import 'package:fedi/app/conversation/conversation_bloc.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationAvatarWidget extends StatelessWidget {
  final double baseAvatarSize;

  const ConversationAvatarWidget({
    this.baseAvatarSize = FediSizes.appBarAvatarSize,
  });

  @override
  Widget build(BuildContext context) {
    IConversationBloc conversationBloc = IConversationBloc.of(context);

    return StreamBuilder<List<IAccount>>(
        stream: conversationBloc.accountsWithoutMeStream,
        builder: (context, snapshot) {
          var accounts = snapshot.data;
          return Provider<List<IAccount>>.value(
            value: accounts,
            child: AccountListAvatarWidget(
              baseAvatarSize: baseAvatarSize,
            ),
          );
        });
  }
}
