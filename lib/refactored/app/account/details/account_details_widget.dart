import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_widget.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_bloc.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_bloc_impl.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsWidget extends StatelessWidget {
  // field to avoid unnecessary recreating
  final accountWidget = AccountWidget();

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return DisposableProvider<IAccountStatusesBloc>(
      create: (context) {
        var accountStatusesBloc = AccountStatusesBloc(
            account: accountBloc.account,
            pleromaAccountService:
                IPleromaAccountService.of(context, listen: false),
            statusRepository: IStatusRepository.of(context, listen: false),
            itemsCountPerPage: 20,
            maximumCachedPagesCount: null);
        return accountStatusesBloc;
      },
      child: DisposableProvider<IStatusPaginationListBloc>(
        create: (context) => StatusPaginationListBloc(
            paginationBloc: IAccountStatusesBloc.of(context, listen: false),
            ),
        child: AccountStatusesWidget(
          header: AccountWidget(),
          alwaysShowHeader: true,
          additionalRefreshAction: accountBloc.requestRefreshFromNetwork,
          key: PageStorageKey(
              "AccountDetailsWidget.${accountBloc.account.remoteId}"),
        ),
      ),
    );
  }
}
