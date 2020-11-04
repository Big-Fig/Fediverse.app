import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/avatar/account_list_avatar_widget.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PleromaChatAvatarWidget extends StatelessWidget {
  final double baseAvatarSize;

  const PleromaChatAvatarWidget({
    this.baseAvatarSize = FediSizes.appBarAvatarSize,
  });

  @override
  Widget build(BuildContext context) {
    IPleromaChatBloc chatBloc = IPleromaChatBloc.of(context);

    return StreamBuilder<List<IAccount>>(
      stream: chatBloc.accountsStream,
      builder: (context, snapshot) {
        var accounts = snapshot.data;
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
