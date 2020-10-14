import 'package:fedi/app/account/select/multi/multi_select_account_page.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusMentionActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return FediIconButton(
      icon: Icon(
        FediIcons.alias,
        color: FediColors.darkGrey,
      ),
      onPressed: () {
        goToMultiSelectAccountPage(
          context,
          excludeMyAccount: true,
          accountsListSelectedCallback: (context, accounts) {
            postStatusBloc.addAccountMentions(accounts);
            Navigator.of(context).pop();
          },
          customLocalAccountListLoader: null,
          customRemoteAccountListLoader: null,
          followingsOnly: false,
        );
      },
    );
  }
}
