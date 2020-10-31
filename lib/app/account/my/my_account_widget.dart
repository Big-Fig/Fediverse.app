import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/account_action_list_widget.dart';
import 'package:fedi/app/account/field/account_field_list_widget.dart';
import 'package:fedi/app/account/my/info/my_account_info_widget.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/note/account_note_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/material.dart';

class MyAccountWidget extends StatelessWidget {
  final OnClickUiCallback onStatusesTapCallback;

  const MyAccountWidget({this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isNotMyAccount = !myAccountBloc.checkAccountIsMe(accountBloc.account);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MyAccountInfoWidget(onStatusesTapCallback: onStatusesTapCallback),
          if (isNotMyAccount)
            Container(
              color: IFediUiColorTheme.of(context).primary,
              child: const AccountActionListWidget(),
            ),
          AccountNoteWidget(
            textStyle: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: FediSizes.accountAvatarBigSize + FediSizes.bigPadding * 2,
              right: FediSizes.bigPadding,
            ),
            child: AccountFieldListWidget(
              brightness: Brightness.dark,
            ),
          ),
        ],
      ),
    );
  }
}
