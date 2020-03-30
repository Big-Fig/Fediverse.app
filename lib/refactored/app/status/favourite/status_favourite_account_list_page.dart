import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/list/account_list_service.dart';
import 'package:fedi/refactored/app/account/pagination/account_pagination_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/account_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/refactored/app/status/favourite/status_favourite_account_list_service_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusFavouriteAccountListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)
              .tr("post.status.favourited_by.title"))),
      body: SafeArea(
        child: AccountPaginationListWidget(
          accountSelectedCallback: (account) =>
              goToAccountDetailsPage(context, account),
          key: PageStorageKey("StatusFavouriteAccountListPage"),
        ),
      ),
    );
  }
}

void goToStatusFavouriteAccountListPage(BuildContext context, IStatus status) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IAccountListService>(
            create: (context) =>
                StatusFavouriteAccountListService.createFromContext(context,
                    status: status),
            child: DisposableProvider<IAccountPaginationBloc>(
              create: (context) => AccountPaginationBloc(
                listService: IAccountListService.of(context, listen: false),
                itemsCountPerPage: 20,
                maximumCachedPagesCount: null,
              ),
              child: DisposableProvider<IAccountPaginationListBloc>(
                create: (context) => AccountPaginationListBloc(
                    paginationBloc:
                        IAccountPaginationBloc.of(context, listen: false)),
                child: StatusFavouriteAccountListPage(),
              ),
            ))),
  );
}
