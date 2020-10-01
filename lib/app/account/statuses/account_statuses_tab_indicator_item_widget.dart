import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_bloc_impl.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountTabTextTabIndicatorItemWidget extends StatelessWidget {
  final List<AccountStatusesTab> accountTabs;
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
            child: DisposableProvider(
              create: (context) => FediTabIndicatorBloc(
                items: accountTabs,
                tabController: tabController,
              ),
              child: FediTextTabIndicatorWidget<AccountStatusesTab>(
                customTabBuilder: (BuildContext context, Widget child,
                    AccountStatusesTab tab) {
                  return child;
                },
                isTransparent: true,
                tabToTextMapper:
                    (BuildContext context, AccountStatusesTab tab) =>
                        mapTabToTitle(context, tab),
              ),
            ),
          );
        },
      );

  static String mapTabToTitle(BuildContext context, AccountStatusesTab tab) {
    switch (tab) {
      case AccountStatusesTab.withReplies:
        return "With replies";
        break;
      case AccountStatusesTab.withoutReplies:
        return "Posts";

        break;
      case AccountStatusesTab.pinned:
        return "Pinned";

        break;
      case AccountStatusesTab.media:
        return "Media";

        break;
    }

    throw "Invalid tab $tab";
  }
}
