import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class AccountStatusesWidget extends FediPaginationListWidget<IStatus> {
  const AccountStatusesWidget({
    Key? key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    ScrollController? scrollController,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          scrollController: scrollController,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  Future additionalPreRefreshAction(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return accountBloc.refreshFromNetwork(isNeedPreFetchRelationship: true);
  }

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var paginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
      context,
      listen: listen,
    );
    return paginationListBloc;
  }
}
