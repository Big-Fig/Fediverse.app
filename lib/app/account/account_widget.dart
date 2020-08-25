import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/account_action_list_widget.dart';
import 'package:fedi/app/account/field/account_field_list_widget.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/info/account_info_widget.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/note/account_note_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final VoidCallback onStatusesTapCallback;

  AccountWidget({this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: AccountHeaderBackgroundWidget(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: FediSizes.bigPadding,
            bottom: FediSizes.smallPadding,
            left: FediSizes.bigPadding,
            right: FediSizes.bigPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
                child: AccountInfoWidget(
                    onStatusesTapCallback: onStatusesTapCallback),
              ),
              if (!myAccountBloc.checkAccountIsMe(accountBloc.account))
                const AccountActionListWidget(),
              AccountNoteWidget(
                textStyle: FediTextStyles.bigTallBoldWhite,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left:
                      FediSizes.accountAvatarBigSize + FediSizes.bigPadding * 2,
                  right: FediSizes.bigPadding,
                ),
                child: const AccountFieldListWidget(
                  brightness: Brightness.light,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
