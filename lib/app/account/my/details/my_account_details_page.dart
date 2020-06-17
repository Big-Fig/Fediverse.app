import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/details/my_account_details_widget.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_drawer_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MyAccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fediNestedScrollViewBloc = IFediNestedScrollViewBloc.of(context);

    return ProxyProvider<IMyAccountBloc, IAccountBloc>(
      update: (context, value, previous) => value,
      child: Scaffold(
        key: _drawerKey,
        backgroundColor: Colors.transparent,
        drawer: const MyAccountSettingsDrawerBodyWidget(),

        body: Stack(
          children: [
            buildNestedScrollView(context),
            StreamBuilder<bool>(
                stream: fediNestedScrollViewBloc.isNestedScrollViewBodyStartScrollStream,
                builder: (context, snapshot) {
                  var isAtLeastStartExpand = snapshot.data;
                  if (isAtLeastStartExpand == false) {
                    return Container(
                        height: MediaQuery
                            .of(context)
                            .padding
                            .top,
                        color: Colors.white);
                  } else {
                    return SizedBox.shrink();
                  }
                })
          ],
        ),

//        body: FediHomeTabContainer.createLikeAppBar(
//            leading: FediIconInCircleTransparentButton(
//              Icons.menu,
//              onPressed: () {
//                _drawerKey.currentState.openDrawer();
//              },
//            ),
//            center: buildAccountChooserButton(context, myAccountBloc),
//            trailing: FediIconInCircleTransparentButton(
//              Icons.settings,
//              onPressed: () {
//                goToEditMyAccountPage(context);
//              },
//            ),
//            body: AccountDetailsWidget()),
      ),
    );
  }

  NestedScrollView buildNestedScrollView(BuildContext context) {
    var nestedScrollController = INestedScrollControllerBloc
        .of(context, listen: false)
        .nestedScrollController;
    return NestedScrollView(
      controller:
      nestedScrollController,
      body: Builder(
          builder: (context) {
            nestedScrollController.enableScroll(context);

            return FediDarkStatusBarStyleArea(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Container(
                  color: Colors.white,
                  child: MyAccountDetailsWidget(),
                ),
              ),
            );
          }
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24.0 + MediaQuery
                        .of(context)
                        .padding
                        .top,
                    bottom: 24.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: FediLightStatusBarStyleArea(
                    child: buildTopBar(context),
                  ),
                ),
//              _buildCollapsedAppBarBody(context)
              ],
            ),
          ),
//            buildSliverAppBar(context, tabs, notificationsTabsBloc),
        ];
      },
    );
  }

  FlatButton buildAccountChooserButton(BuildContext context,
      IMyAccountBloc myAccountBloc) =>
      FlatButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
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

  Widget buildTopBar(BuildContext context) {
    var myAccountBloc = IMyAccountBloc.of(context, listen: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FediIconInCircleTransparentButton(
          Icons.menu,
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
        ),
        buildAccountChooserButton(context, myAccountBloc),
        FediIconInCircleTransparentButton(
          Icons.settings,
          onPressed: () {
            goToEditMyAccountPage(context);
          },
        ),
      ],
    );
  }
}

void goToMyAccountDetailsPagePage(BuildContext context, IAccount account) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyAccountDetailsPage()),
  );
}
