import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/action/account_action_list_widget.dart';
import 'package:fedi/refactored/app/account/field/account_field_grid_widget.dart';
import 'package:fedi/refactored/app/account/info/account_info_widget.dart';
import 'package:fedi/refactored/app/account/note/account_note_widget.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    return Container(
      child: Column(
        children: <Widget>[
          AccountInfoWidget(),
          if (!accountBloc.isMyAccount)
            Container(
              color: Colors.blue[100],
              child: AccountActionListWidget(),
            ),
          AccountNoteWidget(),
          AccountFieldGridWidget(),
        ],
      ),
    );
  }
}
