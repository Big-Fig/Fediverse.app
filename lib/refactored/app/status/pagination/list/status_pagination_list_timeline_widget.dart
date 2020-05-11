import 'package:fedi/refactored/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_base_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPaginationListTimelineWidget
    extends StatusPaginationListBaseWidget {
  final bool needWatchLocalRepositoryForUpdates;

  StatusPaginationListTimelineWidget(
      {@required Key key, @required this.needWatchLocalRepositoryForUpdates})
      : super(key: key);

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
          itemBuilder: (context, index) {
            EdgeInsets edgeInsets;
            if (index == 0) {
              edgeInsets = EdgeInsets.only(bottom: 8.0);
            } else {
              edgeInsets = EdgeInsets.symmetric(vertical: 8.0);
            }
            return Provider<IStatus>.value(
              value: items[index],
              child: DisposableProxyProvider<IStatus, IStatusBloc>(
                  update: (context, status, oldValue) {
                    var collapsibleBloc =
                        ICollapsibleBloc.of(context, listen: false);

                    var statusBloc = StatusBloc.createFromContext(
                        context, status,
                        isNeedWatchLocalRepositoryForUpdates:
                            needWatchLocalRepositoryForUpdates);

                    collapsibleBloc.addVisibleItem(statusBloc);

                    statusBloc.addDisposable(disposable: CustomDisposable(() {
                      collapsibleBloc.removeVisibleItem(statusBloc);
                    }));

                    return statusBloc;
                  },
                  child: Padding(
                    padding: edgeInsets,
                    child: Container(
                        decoration: BoxDecoration(
                          color: FediColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 3,
                              blurRadius: 7,
                            )
                          ],
                        ),
                        child: StatusListItemTimelineWidget(
                          collapsible: true,
                        )),
                  )),
            );
          });
}
