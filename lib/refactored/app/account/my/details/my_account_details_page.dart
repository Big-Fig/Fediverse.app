import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_widget.dart';
import 'package:fedi/refactored/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/refactored/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MyAccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    return ProxyProvider<IMyAccountBloc, IAccountBloc>(
      update: (context, value, previous) => value,
      child: Scaffold(
        body: FediHomeTabContainer.createLikeAppBar(
            leading: FediIconInCircleTransparentButton(
              Icons.menu,
              onPressed: () {
                _drawerKey.currentState.openDrawer();
              },
            ),
            center: buildAccountChooserButton(context, myAccountBloc),
            trailing: FediIconInCircleTransparentButton(
              Icons.settings,
              onPressed: () {
                goToEditMyAccountPage(context);
              },
            ),
            body: AccountDetailsWidget()),
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
            const Icon(
              Icons.keyboard_arrow_down,
              color: FediColors.white,
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
      minFontSize: 10,
      maxFontSize: 20,
      style: TextStyle(
        color: FediColors.white,
      ),
    );
  }

  const MyAccountDetailsPage();
}

void goToMyAccountDetailsPagePage(BuildContext context, IAccount account) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyAccountDetailsPage()),
  );
}
