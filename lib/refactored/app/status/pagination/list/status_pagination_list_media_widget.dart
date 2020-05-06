import 'package:fedi/refactored/app/status/list/status_list_item_media_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_base_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_page.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_pagination_list_media_widget.dart");

class StatusPaginationListMediaWidget extends StatusPaginationListBaseWidget {
  StatusPaginationListMediaWidget({@required Key key}) : super(key: key);

  @override
  ScrollView buildItemsCollectionView(
      {@required BuildContext context,
      @required List<IStatus> items,
      @required Widget header,
      @required Widget footer}) {
    _logger.finest(() => "buildItemsCollectionView ${items?.length}");

    var mediaStatuses = items;

    var length = mediaStatuses.length;
    if (header != null) {
      length += 1;
    }
    if (footer != null) {
      length += 1;
    }

    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: length,
      itemBuilder: (BuildContext context, int index) {
        if (header != null && index == 0) {
          return header;
        } else if (footer != null && index == length - 1) {
          return footer;
        }
        var itemIndex = index;
        if (header != null) {
          itemIndex -= 1;
        }

        _logger.finest(() => "itemBuilder itemIndex=$itemIndex");
        var status = mediaStatuses[itemIndex];
        return Provider<IStatus>.value(
          value: status,
          child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, status, oldValue) =>
                  StatusBloc.createFromContext(context, status),
              child: GestureDetector(
                onTap: () {
                  goToStatusThreadPage(context, status);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: StatusListItemMediaWidget()),
                ),
              )),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
