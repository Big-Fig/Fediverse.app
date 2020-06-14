import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/details/account_details_widget.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_overlay_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("my_account_details_widget.dart");

class MyAccountDetailsWidget extends AccountDetailsWidget {
  const MyAccountDetailsWidget();

  @override
  Widget buildListWithNewItemsOverlayContainer(BuildContext context) {
    return Stack(
        children: [buildBody(context), _buildOverlayNewItems(context)]);
  }

  Builder _buildOverlayNewItems(BuildContext context) => Builder(
        builder: (context) {
          var fediSliverAppBarBloc =
              IFediSliverAppBarBloc.of(context, listen: false);
          return StreamBuilder<bool>(
              stream: fediSliverAppBarBloc.isAtLeastStartExpandStream,
              builder: (context, snapshot) {
                var isAtLeastStartExpand = snapshot.data;
                var topPadding = isAtLeastStartExpand == true
                    ? 24.0
                    : 24.0 + MediaQuery.of(context).padding.top;

                _logger.finest(() => "topPadding $topPadding");

//
//                            topPadding =
//                                24.0 + MediaQuery.of(context).padding.top;
//                                24.0;
                return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: topPadding),
                      child: PaginationListWithNewItemsOverlayWidget(
                        textBuilder: (context, updateItemsCount) => plural(
                            "app.status.list.new_items"
                            ".action.tap_to_load_new",
                            updateItemsCount),
                      ),
                    ));
              });
        },
      );
}
