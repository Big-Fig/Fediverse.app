import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_widget.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_bloc_impl.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_widget.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsWidget extends StatelessWidget {
  // field to avoid unnecessary recreating
  final accountWidget = AccountWidget();

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return DisposableProvider<IStatusCachedListService>(
      create: (context) => AccountStatusesBloc.createFromContext(context,
          account: accountBloc.account),
      child:
          DisposableProvider<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
        create: (context) =>
            StatusCachedPaginationBloc.createFromContext(context),
        child: DisposableProvider<IStatusPaginationListBloc>(
          create: (context) =>
              StatusPaginationListBloc.createFromContext(context),
          child: AccountStatusesWidget(
            header: AccountWidget(),
            alwaysShowHeader: true,
            additionalRefreshAction: accountBloc.requestRefreshFromNetwork,
            key: PageStorageKey(
                "AccountDetailsWidget.${accountBloc.account.remoteId}"),
          ),
        ),
      ),
    );
  }
}
