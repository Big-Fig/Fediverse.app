import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/status/favourite/status_favourite_account_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusFavouriteAccountListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.status.favourited_by.title"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: FediPadding.allBigPadding,
              child: Text(
                "app.account.list.privacy".tr(),
                textAlign: TextAlign.center,
                style: IFediUiTextTheme.of(context).mediumShortBoldGrey,
              ),
            ),
            Expanded(
              child: AccountPaginationListWidget(
                accountSelectedCallback: (context, account) =>
                    goToAccountDetailsPage(context, account),
                key: PageStorageKey("StatusFavouriteAccountListPage"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  const StatusFavouriteAccountListPage();
}

void goToStatusFavouriteAccountListPage(BuildContext context, IStatus status) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StatusFavouriteAccountCachedListBloc.provideToContext(
        context,
        status: status,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: AccountPaginationListBloc.provideToContext(
            context,
            child: StatusFavouriteAccountListPage(),
          ),
        ),
      )),
  );
}
