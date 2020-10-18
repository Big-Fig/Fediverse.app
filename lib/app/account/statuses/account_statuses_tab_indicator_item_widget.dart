import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_bloc.dart';
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
            fadingColor: IFediUiColorTheme.of(context).darkGrey,
            child:
                DisposableProvider<IFediTabIndicatorBloc<AccountStatusesTab>>(
              create: (context) => FediTabIndicatorBloc<AccountStatusesTab>(
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
        return "app.account.statuses.tab.with_replies".tr();
        break;
      case AccountStatusesTab.withoutReplies:
        return "app.account.statuses.tab.without_replies".tr();

        break;
      case AccountStatusesTab.pinned:
        return "app.account.statuses.tab.pinned".tr();

        break;
      case AccountStatusesTab.media:
        return "app.account.statuses.tab.media".tr();

        break;
    }

    throw "Invalid tab $tab";
  }
}
