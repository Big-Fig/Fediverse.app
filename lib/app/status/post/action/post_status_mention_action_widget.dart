import 'package:fedi/app/account/select/select_account_page.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusMentionActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return IconButton(
      icon: Icon(
        FediIcons.alias,
        color: FediColors.darkGrey,
      ),
      onPressed: () {
        goToSelectAccountPage(context, excludeMyAccount: true,
            accountSelectedCallback: (context, account) {
          postStatusBloc.addMentionByAccount(account);
          Navigator.of(context).pop();
        });
      },
    );
  }
}
