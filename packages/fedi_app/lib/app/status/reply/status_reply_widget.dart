import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi_app/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/thread/local_status_thread_page.dart';
import 'package:fedi_app/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger('status_reply_widget.dart');

class StatusReplyWidget extends StatelessWidget {
  final bool collapsible;

  const StatusReplyWidget({
    Key? key,
    required this.collapsible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusReplyLoaderBloc =
        IStatusReplyLoaderBloc.of(context, listen: false);

    return StreamBuilder<AsyncInitLoadingState>(
      stream: statusReplyLoaderBloc.initLoadingStateStream,
      initialData: statusReplyLoaderBloc.initLoadingState,
      builder: (context, snapshot) {
        var loadingState = snapshot.data;

        switch (loadingState) {
          case null:
          case AsyncInitLoadingState.notStarted:
          case AsyncInitLoadingState.loading:
            return const _StatusReplyLoadingWidget();
          case AsyncInitLoadingState.finished:
            var inReplyToStatus = statusReplyLoaderBloc.inReplyToStatus;

            if (inReplyToStatus != null) {
              return Provider<IStatus>.value(
                value: inReplyToStatus,
                child: DisposableProxyProvider<IStatus,
                    IStatusListItemTimelineBloc>(
                  update: (context, status, _) =>
                      StatusListItemTimelineBloc.list(
                    status: status,
                    collapsible: collapsible,
                    isFirstReplyInThread: false,
                    statusCallback: _onStatusClick,
                    initialMediaAttachment: null,
                  ),
                  child: const StatusListItemTimelineWidget(),
                ),
              );
            } else {
              _logger.warning(
                () => 'loading finished but inReplyToStatus is null',
              );

              return const SizedBox.shrink();
            }

          case AsyncInitLoadingState.failed:
            return const _StatusReplyFailedWidget();
        }
      },
    );
  }
}

class _StatusReplyFailedWidget extends StatelessWidget {
  const _StatusReplyFailedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.allSmallPadding,
        child: Text(
          S.of(context).app_status_reply_loading_failed,
        ),
      );
}

class _StatusReplyLoadingWidget extends StatelessWidget {
  const _StatusReplyLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.allSmallPadding,
        child: Column(
          children: [
            Padding(
              padding: FediPadding.allSmallPadding,
              child: Text(
                S.of(context).app_status_reply_loading_progress,
              ),
            ),
            const Padding(
              padding: FediPadding.allSmallPadding,
              child: FediCircularProgressIndicator(),
            ),
          ],
        ),
      );
}

void _onStatusClick(BuildContext context, IStatus status) {
  var statusBloc = IStatusBloc.of(context, listen: false);

  var isLocal = statusBloc.instanceLocation == InstanceLocation.local;

  if (isLocal) {
    goToLocalStatusThreadPage(
      context,
      status: status,
      initialMediaAttachment: null,
    );
  } else {
    goToRemoteStatusThreadPageBasedOnRemoteInstanceStatusWithoutRemoteInstanceBloc(
      context,
      remoteInstanceStatus: status,
      remoteInstanceInitialMediaAttachment: null,
    );
  }
}
