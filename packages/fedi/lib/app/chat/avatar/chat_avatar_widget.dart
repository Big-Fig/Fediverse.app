import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/avatar/account_list_avatar_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatAvatarWidget extends StatelessWidget {
  final double baseAvatarSize;

  const ChatAvatarWidget({
    Key? key,
    this.baseAvatarSize = FediSizes.appBarAvatarSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

    return StreamBuilder<List<IAccount>>(
      stream: chatBloc.accountsStream,
      builder: (context, snapshot) {
        var accounts = snapshot.data ?? chatBloc.accounts;

        return Provider<List<IAccount>>.value(
          value: accounts,
          child: AccountListAvatarWidget(
            baseAvatarSize: baseAvatarSize,
          ),
        );
      },
    );
  }
}
