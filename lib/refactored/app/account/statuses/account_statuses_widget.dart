import 'package:fedi/refactored/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountStatusesWidget extends PaginationListWidget<IStatus> {
  AccountStatusesWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    RefreshAction additionalRefreshAction,
  }) : super(
            key: key,
            footer: footer,
            header: header,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
            additionalRefreshAction: additionalRefreshAction);

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IStatus> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IStatus>.value(
                value: items[index],
                child: DisposableProxyProvider<IStatus, IStatusBloc>(
                    update: (context, status, oldValue) =>
                        StatusBloc.createFromContext(context, status),
                    child: StatusListItemTimelineWidget()),
              ));

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    IStatusPaginationListBloc timelinePaginationListBloc =
        IStatusPaginationListBloc.of(context, listen: listen);
    return timelinePaginationListBloc;
  }
}
