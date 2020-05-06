import 'package:fedi/refactored/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
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
                    update: (context, status, oldValue) {
                      var collapsibleBloc =
                          ICollapsibleBloc.of(context, listen: false);

                      var statusBloc =
                          StatusBloc.createFromContext(context, status);

                      collapsibleBloc.addVisibleItem(statusBloc);

                      statusBloc.addDisposable(disposable: CustomDisposable(() {
                        collapsibleBloc.removeVisibleItem(statusBloc);
                      }));

                      return statusBloc;
                    },
                    child: StatusListItemTimelineWidget(
                      collapsible: true,
                    )),
              ));

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var timelinePaginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            context,
            listen: listen);
    return timelinePaginationListBloc;
  }
}
