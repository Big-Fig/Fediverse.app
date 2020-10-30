import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusMentionActionWidget extends StatelessWidget {
  const PostStatusMentionActionWidget();
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return FediIconButton(
      icon: Icon(
        FediIcons.alias,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      onPressed: () {
        goToSingleSelectAccountPage(
          context,
          excludeMyAccount: true,
          accountSelectedCallback: (context, account) {
            postStatusBloc.addAccountMentions([account]);
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
