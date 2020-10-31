import 'package:fedi/app/account/details/account_details_widget.dart';
import 'package:fedi/app/account/my/details/my_account_details_body_widget.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountDetailsWidget extends StatefulWidget {
  const MyAccountDetailsWidget();

  @override
  _MyAccountDetailsWidgetState createState() => _MyAccountDetailsWidgetState();
}

class _MyAccountDetailsWidgetState extends State<MyAccountDetailsWidget> {
  ScrollControllerBloc scrollControllerBloc;
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollControllerBloc =
        ScrollControllerBloc(scrollController: scrollController);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    scrollControllerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) => Provider.value(
        value: scrollControllerBloc,
        child: AccountDetailsWidget.buildAccountDetailsProviders(
          context,
          buildListWithNewItemsOverlayContainer(context),
        ),
      );

  Widget buildListWithNewItemsOverlayContainer(BuildContext context) => Stack(
        children: [
          MyAccountDetailsBodyWidget(scrollController: scrollController),
          const StatusListTapToLoadOverlayWidget()
        ],
      );
}
