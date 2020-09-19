import 'package:fedi/app/status/list/status_list_item_media_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_base_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_cached_pagination_list_media_widget.dart");

class StatusCachedPaginationListMediaWidget
    extends StatusCachedPaginationListBaseWidget {
  StatusCachedPaginationListMediaWidget({Key key}) : super(key: key);

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
  retrievePaginationListBloc(BuildContext context,
      {@required bool listen}) {
    var timelinePaginationListBloc =
    Provider.of<IPaginationListBloc<CachedPaginationPage<IStatus>, IStatus>>(
        context,
        listen: listen);
    return timelinePaginationListBloc;
  }

  static ScrollView buildStaggeredMediaGridView({
    @required BuildContext context,
    @required List<IStatus> items,
    @required Widget header,
    @required Widget footer
  }) {
    _logger.finest(() => "buildStaggeredGridView ${items?.length}");

    // all statuses should be already with media attachments
    items = items
        .where((status) =>
    status.mediaAttachments
        ?.where((mediaAttachment) => mediaAttachment.isImageOrGif)
        ?.isNotEmpty ==
        true)
        .toList();

    var statusesWithMediaAttachment = <_StatusWithMediaAttachment>[];

    items.forEach((status) {
      var mediaAttachments = status.mediaAttachments
          ?.where((mediaAttachment) => mediaAttachment.isImageOrGif);
      mediaAttachments.forEach((mediaAttachment) {
        statusesWithMediaAttachment.add(_StatusWithMediaAttachment(
            status: status, mediaAttachment: mediaAttachment));
      });
    });

    var length = statusesWithMediaAttachment.length;
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

        var statusWithMediaAttachment = statusesWithMediaAttachment[itemIndex];

        return Provider<IStatus>.value(
          value: statusWithMediaAttachment.status,
          child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, status, oldValue) =>
                  StatusBloc.createFromContext(context, status),
              child: InkWell(
                onTap: () {
                  goToStatusThreadPage(
                      context, statusWithMediaAttachment.status);
                },
                child: Padding(
                  padding: FediPadding.allSmallPadding,
                  child: Center(
                    child: Provider<IPleromaMediaAttachment>.value(
                        value: statusWithMediaAttachment.mediaAttachment,
                        child: StatusListItemMediaWidget()),
                  ),
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

  @override
  ScrollView buildItemsCollectionView({@required BuildContext context,
    @required List<IStatus> items,
    @required Widget header,
    @required Widget footer}) => buildStaggeredMediaGridView(context: context, items: items,
      header: header, footer: footer,);
}

class _StatusWithMediaAttachment {
  final IStatus status;
  final IPleromaMediaAttachment mediaAttachment;

  _StatusWithMediaAttachment({
    @required this.status,
    @required this.mediaAttachment,
  });

  @override
  String toString() {
    return '_StatusWithMediaAttachment{status: $status, mediaAttachment: $mediaAttachment}';
  }
}
