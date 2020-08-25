import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/account_action_list_widget.dart';
import 'package:fedi/app/account/field/account_field_list_widget.dart';
import 'package:fedi/app/account/my/info/my_account_info_widget.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/note/account_note_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';

class MyAccountWidget extends StatelessWidget {
  final VoidCallback onStatusesTapCallback;

  MyAccountWidget({this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MyAccountInfoWidget(onStatusesTapCallback: onStatusesTapCallback),
          if (!myAccountBloc.checkAccountIsMe(accountBloc.account))
            Container(
              color: FediColors.primaryColor,
              child: const AccountActionListWidget(),
            ),
          AccountNoteWidget(
            textStyle: FediTextStyles.bigTallBoldDarkGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: FediSizes.accountAvatarBigSize + FediSizes.bigPadding * 2,
              right: FediSizes.bigPadding,
            ),
            child: const AccountFieldListWidget(
              brightness: Brightness.dark,
            ),
          ),
        ],
      ),
    );
  }
}
