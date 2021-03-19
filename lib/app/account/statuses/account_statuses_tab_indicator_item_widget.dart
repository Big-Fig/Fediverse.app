import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_bloc.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_bloc_impl.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountTabTextTabIndicatorItemWidget extends StatelessWidget {
  final List<AccountStatusesTab> accountTabs;

  const AccountTabTextTabIndicatorItemWidget({
    required this.accountTabs,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;
          return FediFadeShaderMask(
            fadingPercent: fadingPercent,
            fadingColor: IFediUiColorTheme.of(context).darkGrey,
            child: DisposableProxyProvider<TabController,
                IFediTabIndicatorBloc<AccountStatusesTab>>(
              update: (context, tabController, _) =>
                  FediTabIndicatorBloc<AccountStatusesTab>(
                items: accountTabs,
                tabController: tabController,
              ),
              child: FediTextTabIndicatorWidget<AccountStatusesTab>(
                customTabBuilder: (
                  BuildContext context,
                  Widget child,
                  AccountStatusesTab tab,
                ) {
                  return child;
                },
                isTransparent: true,
                tabToTextMapper:
                    (BuildContext context, AccountStatusesTab? tab) =>
                        mapTabToTitle(context, tab!),
              ),
            ),
          );
        },
      );

  static String mapTabToTitle(BuildContext context, AccountStatusesTab tab) {
    switch (tab) {
      case AccountStatusesTab.withReplies:
        return S.of(context).app_account_statuses_tab_withReplies;
      case AccountStatusesTab.withoutReplies:
        return S.of(context).app_account_statuses_tab_withoutReplies;
      case AccountStatusesTab.pinned:
        return S.of(context).app_account_statuses_tab_pinned;
      case AccountStatusesTab.media:
        return S.of(context).app_account_statuses_tab_media;
      case AccountStatusesTab.favourites:
        return S.of(context).app_account_statuses_tab_favourites;
    }
  }
}
