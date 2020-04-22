import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_widget.dart';
import 'package:fedi/refactored/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/refactored/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAccountBloc = IMyAccountBloc.of(context, listen: true);
    return Provider<IAccountBloc>(
      create: (context) => IMyAccountBloc.of(context, listen: false),
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox.shrink(),
          centerTitle: true,
          title: buildAccountChooserButton(context, myAccountBloc),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                goToEditMyAccountPage(context);
              },
            )
          ],
        ),
        body: SafeArea(child: AccountDetailsWidget()),
      ),
    );
  }

  FlatButton buildAccountChooserButton(
          BuildContext context, IMyAccountBloc myAccountBloc) =>
      FlatButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCurrentInstanceNameWidget(context),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () {
          showMyAccountActionListBottomSheetDialog(context);
        },
      );

  Widget buildCurrentInstanceNameWidget(BuildContext context) {
    var currentInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);
    return AutoSizeText(
      currentInstanceBloc.currentInstance.userAtHost,
      minFontSize: 12,
      maxFontSize: 20,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}

void goToMyAccountDetailsPagePage(BuildContext context, IAccount account) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyAccountDetailsPage()),
  );
}
