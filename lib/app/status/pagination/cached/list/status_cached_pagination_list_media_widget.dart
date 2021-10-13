import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_media_widget.dart';
import 'package:fedi/app/status/local_status_bloc_impl.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_base_widget.dart';
import 'package:fedi/app/status/remote_status_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/local_status_thread_page.dart';
import 'package:fedi/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('status_cached_pagination_list_media_widget.dart');

class StatusCachedPaginationListMediaWidget
    extends StatusCachedPaginationListBaseWidget {
  const StatusCachedPaginationListMediaWidget({
    Key? key,
  }) : super(key: key);

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var timelinePaginationListBloc = Provider.of<
        IPaginationListBloc<CachedPaginationPage<IStatus>, IStatus>>(
      context,
      listen: listen,
    );

    return timelinePaginationListBloc;
  }

  static ScrollView buildStaggeredMediaGridView({
    required BuildContext context,
    required List<IStatus> items,
    required Widget? header,
    required Widget? footer,
  }) {
    _logger.finest(() => 'buildStaggeredGridView ${items.length}');
    var statusListBloc = IStatusListBloc.of(context);
    var instanceLocation = statusListBloc.instanceLocation;
    var isLocal = instanceLocation == InstanceLocation.local;

    // all statuses should be already with media attachments
    items = filterItemsWithMedia(items);

    var statusesWithMediaAttachment = mapToStatusesWithAttachments(items);

    var length = statusesWithMediaAttachment.length;
    if (header != null) {
      length += 1;
    }
    if (footer != null) {
      length += 1;
    }

    return StaggeredGridView.countBuilder(
      // ignore: no-magic-number
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

        _logger.finest(() => 'itemBuilder itemIndex=$itemIndex');

        var statusWithMediaAttachment = statusesWithMediaAttachment[itemIndex];

        return Provider<StatusWithMediaAttachment>.value(
          value: statusWithMediaAttachment,
          child: _StatusCachedPaginationListMediaItemWidget(
            isLocal: isLocal,
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          // ignore: no-magic-number
          StaggeredTile.count(2, index.isEven ? 2 : 1),
    );
  }

  static List<StatusWithMediaAttachment> mapToStatusesWithAttachments(
    List<IStatus> items,
  ) {
    var statusesWithMediaAttachment = <StatusWithMediaAttachment>[];

    items.forEach(
      (status) {
        var mediaAttachments = (status.reblog?.mediaAttachments ??
                status.mediaAttachments ??
                <UnifediApiMediaAttachment>[])
            .where(
          (mediaAttachment) => mediaAttachment.typeAsUnifediApi.isImageOrGif,
        );
        // ignore: cascade_invocations
        mediaAttachments.forEach(
          (mediaAttachment) {
            statusesWithMediaAttachment.add(
              StatusWithMediaAttachment(
                status: status,
                mediaAttachment: mediaAttachment,
              ),
            );
          },
        );
      },
    );

    return statusesWithMediaAttachment;
  }

  static List<IStatus> filterItemsWithMedia(List<IStatus> items) => items
      .where(
        (IStatus status) =>
            (status.reblog?.mediaAttachments ?? status.mediaAttachments)
                ?.where(
                  (mediaAttachment) =>
                      mediaAttachment.typeAsUnifediApi.isImageOrGif,
                )
                .isNotEmpty ==
            true,
      )
      .toList();

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<IStatus> items,
    required Widget? header,
    required Widget? footer,
  }) =>
      buildStaggeredMediaGridView(
        context: context,
        items: items,
        header: header,
        footer: footer,
      );
}

class _StatusCachedPaginationListMediaItemWidget extends StatelessWidget {
  const _StatusCachedPaginationListMediaItemWidget({
    Key? key,
    required this.isLocal,
  }) : super(key: key);

  final bool isLocal;

  @override
  Widget build(BuildContext context) => UnfocusOnScrollAreaWidget(
        child: Container(
          color: IFediUiColorTheme.of(context).offWhite,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ProxyProvider<StatusWithMediaAttachment, IStatus>(
              update: (context, value, previous) => value.status,
              child: DisposableProxyProvider<IStatus, IStatusBloc>(
                update: (context, status, oldValue) {
                  if (isLocal) {
                    // todo: refactor copy-pasted code
                    if (status.remoteId == oldValue?.remoteId) {
                      return oldValue!;
                    } else {
                      return LocalStatusBloc.createFromContext(
                        context,
                        status: status,
                      );
                    }
                  } else {
                    return RemoteStatusBloc.createFromContext(
                      context,
                      status: status,
                    );
                  }
                },
                child:
                    DisposableProxyProvider<IStatusBloc, IStatusSensitiveBloc>(
                  update: (context, statusBloc, _) =>
                      StatusSensitiveBloc.createFromContext(
                    context: context,
                    statusBloc: statusBloc,
                  ),
                  child: _StatusCachedPaginationListMediaItemBodyWidget(
                    isLocal: isLocal,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _StatusCachedPaginationListMediaItemBodyWidget extends StatelessWidget {
  const _StatusCachedPaginationListMediaItemBodyWidget({
    Key? key,
    required this.isLocal,
  }) : super(key: key);

  final bool isLocal;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          var statusWithMediaAttachment =
              Provider.of<StatusWithMediaAttachment>(
            context,
            listen: false,
          );
          if (isLocal) {
            goToLocalStatusThreadPage(
              context,
              status: statusWithMediaAttachment.status,
              initialMediaAttachment: statusWithMediaAttachment.mediaAttachment,
            );
          } else {
            goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
              context,
              remoteInstanceStatus: statusWithMediaAttachment.status,
              remoteInstanceInitialMediaAttachment:
                  statusWithMediaAttachment.mediaAttachment,
            );
          }
        },
        child: Padding(
          padding: FediPadding.allSmallPadding,
          child: Center(
            child: ProxyProvider<StatusWithMediaAttachment,
                IUnifediApiMediaAttachment>(
              update: (context, value, previous) => value.mediaAttachment,
              child: const StatusListItemMediaWidget(),
            ),
          ),
        ),
      );
}

class StatusWithMediaAttachment {
  final IStatus status;
  final IUnifediApiMediaAttachment mediaAttachment;

  StatusWithMediaAttachment({
    required this.status,
    required this.mediaAttachment,
  });

  @override
  String toString() => '_StatusWithMediaAttachment{'
      'status: $status,'
      ' mediaAttachment: $mediaAttachment}';
}
