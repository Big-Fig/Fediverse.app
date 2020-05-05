import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/refactored/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';

class SearchStatusesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DisposableProvider<ICollapsibleBloc>(
      create: (context) => CollapsibleBloc.createFromContext(context),
      child: Stack(
        children: <Widget>[
          StatusPaginationListTimelineWidget(
            key: PageStorageKey("SearchStatusesListWidget"),
            needWatchLocalRepositoryForUpdates: false,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToggleCollapsibleOverlayWidget(),
              ))
        ],
      ),
    );
  }
}
