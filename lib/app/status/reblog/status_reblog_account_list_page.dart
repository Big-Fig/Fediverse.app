import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/status/reblog/status_reblog_account_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusReblogAccountListPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_status_rebloggedBy_title,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const _StatusReblogAccountListPrivacyWarningWidget(),
            const Expanded(
              child: AccountPaginationListWidget(
                accountSelectedCallback: goToAccountDetailsPage,
                key: PageStorageKey("StatusReblogAccountListPage"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  const StatusReblogAccountListPage();
}

class _StatusReblogAccountListPrivacyWarningWidget extends StatelessWidget {
  const _StatusReblogAccountListPrivacyWarningWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allBigPadding,
      child: Text(
        S.of(context).app_account_list_privacy,
        textAlign: TextAlign.center,
        style: IFediUiTextTheme.of(context).mediumShortBoldGrey,
      ),
    );
  }
}

void goToStatusReblogAccountListPage(BuildContext context, IStatus status) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            StatusReblogAccountCachedListBloc.provideToContext(
              context,
              status: status.reblog ?? status,
              child: AccountCachedPaginationBloc.provideToContext(
                context,
                child: AccountPaginationListBloc.provideToContext(context,
                    child: const StatusReblogAccountListPage()),
              ),
            )),
  );
}
