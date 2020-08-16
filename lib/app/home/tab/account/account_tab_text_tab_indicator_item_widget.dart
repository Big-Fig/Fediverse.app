import 'package:fedi/app/home/tab/account/account_home_tab_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountTabTextTabIndicatorItemWidget extends StatelessWidget {
  final List<AccountTab> accountTabs;
  final TabController tabController;

  AccountTabTextTabIndicatorItemWidget({
    @required this.accountTabs,
    @required this.tabController,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;
          return FediFadeShaderMask(
            fadingPercent: fadingPercent,
            fadingColor: FediColors.darkGrey,
            child: FediTextTabIndicatorWidget<AccountTab>(
              customTabBuilder:
                  (BuildContext context, Widget child, AccountTab tab) {
                return child;
//                var widget = CachedPaginationListWithNewItemsUnreadBadgeWidget(
//                    child: child);
//
//                var accountTabsBloc =
//                    IAccountTabsBloc.of(context, listen: false);
//
//                var tabPaginationListBloc =
//                    accountTabsBloc.retrieveAccountTabPaginationListBloc(tab);
//
//                return Provider<ICachedPaginationListWithNewItemsBloc>.value(
//                  value: tabPaginationListBloc,
//                  child: widget,
//                );
              },
              tabController: tabController,
              isTransparent: true,
              tabs: accountTabs,
              tabToTextMapper: (BuildContext context, AccountTab tab) =>
                  mapTabToTitle(context, tab),
            ),
          );
        },
      );

  static String mapTabToTitle(BuildContext context, AccountTab tab) {
    switch (tab) {
      case AccountTab.withReplies:
        return "With replies";
        break;
      case AccountTab.withoutReplies:
        return "Posts";

        break;
      case AccountTab.pinned:
        return "Pinned";

        break;
      case AccountTab.media:
        return "Media";

        break;
    }

    throw "Invalid tab $tab";
  }
}
