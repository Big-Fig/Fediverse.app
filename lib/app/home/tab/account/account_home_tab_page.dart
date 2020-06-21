import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/details/account_details_widget.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/details/my_account_details_body_widget.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_drawer_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_without_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class AccountHomeTabPage extends StatelessWidget {
  const AccountHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FediColors.primaryColorDark,
        key: _drawerKey,
        drawer: const MyAccountSettingsDrawerBodyWidget(),
        body: Stack(
          children: [
            ProxyProvider<IMyAccountBloc, IAccountBloc>(
              update: (context, value, previous) => value,
              child: Container(
                height: 150.0,
                child: const AccountHeaderBackgroundWidget(),
              ),
            ),
            _buildBody(context),
          ],
        ),
      );

  Widget _buildBody(BuildContext context) =>
      FediNestedScrollViewWithoutNestedScrollableTabsWidget(
        onLongScrollUpTopOverlayWidget: null,
        topSliverScrollOffsetToShowWhiteStatusBar: null,
        topSliverWidgets: [
          FediTabMainHeaderBarWidget(
            leadingWidgets: null,
            content: Row(
              children: [
                _buildDrawerAction(context),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: buildAccountChooserButton(context)),
                SizedBox(
                  width: 16.0,
                ),
                _buildSettingsAction(context)
              ],
            ),
            endingWidgets: null,
          ),
        ],
        providerBuilder: (context, child) =>
            ProxyProvider<IMyAccountBloc, IAccountBloc>(
          update: (context, value, previous) => value,
          child: Builder(
            builder: (context) =>
                AccountDetailsWidget.buildAccountDetailsProviders(
                    context, child),
          ),
        ),
        contentBuilder: (context) {
          return FediDarkStatusBarStyleArea(
            child: ClipRRect(
              borderRadius: FediSizes.defaultClipRRectBorderRadius,
              child: Container(
                color: Colors.white,
                child: MyAccountDetailsBodyWidget(),
              ),
            ),
          );
        },
        overlayBuilder: (context) => StatusListTapToLoadOverlayWidget(),
      );

  Widget _buildSettingsAction(BuildContext context) =>
      FediIconInCircleTransparentButton(
        FediIcons.settings,
        onPressed: () {
          goToEditMyAccountPage(context);
        },
      );

  Widget _buildDrawerAction(BuildContext context) =>
      FediIconInCircleTransparentButton(
        Icons.menu,
        onPressed: () {
          _drawerKey.currentState.openDrawer();
        },
      );

  Widget buildAccountChooserButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMyAccountActionListBottomSheetDialog(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(child: buildCurrentInstanceNameWidget(context)),
          SizedBox(
            width: 8.0,
          ),
          const Icon(
            FediIcons.chevron_down,
            size: 18.0,
            color: FediColors.white,
          ),
        ],
      ),
    );
  }

  Widget buildCurrentInstanceNameWidget(BuildContext context) {
    var currentInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return AutoSizeText(
      currentInstanceBloc.currentInstance.userAtHost,
      minFontSize: 12.0,
      maxFontSize: 18.0,
      maxLines: 1,
      style: TextStyle(
          fontWeight: FontWeight.w500, color: FediColors.white, fontSize: 18.0),
    );
  }
}
