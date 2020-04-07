import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/app/status/favourite/status_favourite_account_list_service_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusReblogAccountListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)
              .tr("app.status.reblogged_by.title"))),
      body: SafeArea(
        child: AccountPaginationListWidget(
          accountSelectedCallback: (account) =>
              goToAccountDetailsPage(context, account),
          key: PageStorageKey("StatusReblogAccountListPage"),
        ),
      ),
    );
  }
}

void goToStatusReblogAccountListPage(BuildContext context, IStatus status) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IPleromaCachedListService<IAccount>>(
            create: (context) =>
                StatusFavouriteAccountListService.createFromContext(context,
                    status: status),
            child: DisposableProvider<
                IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
              create: (context) =>
                  AccountCachedPaginationBloc.createFromContext(context),
              child: DisposableProvider<IAccountPaginationListBloc>(
                create: (context) =>
                    AccountPaginationListBloc.createFromContext(context),
                child: StatusReblogAccountListPage(),
              ),
            ))),
  );
}
