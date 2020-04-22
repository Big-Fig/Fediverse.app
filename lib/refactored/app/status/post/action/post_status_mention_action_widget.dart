import 'package:fedi/refactored/app/account/select/select_account_page.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusMentionActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return IconButton(
      icon: Icon(
        Icons.alternate_email,
        color: Colors.blue,
      ),
      onPressed: () {
        goToSelectAccountPage(context, excludeMyAccount: true,
            accountSelectedCallback: (account) {
          postStatusBloc.addMentionByAccount(account);
          Navigator.of(context).pop();
        });
      },
    );
  }
}
