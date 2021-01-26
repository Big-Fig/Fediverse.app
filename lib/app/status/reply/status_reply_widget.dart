import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/local_status_thread_page.dart';
import 'package:fedi/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusReplyWidget extends StatelessWidget {
  final bool collapsible;

  StatusReplyWidget({@required this.collapsible});

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
          case AsyncInitLoadingState.notStarted:
          case AsyncInitLoadingState.loading:
            return const _StatusReplyLoadingWidget();
            break;
          case AsyncInitLoadingState.finished:
            return Provider<IStatus>.value(
              value: statusReplyLoaderBloc.inReplyToStatus,
              child: _buildStatusListItemTimelineWidget(),
            );
            break;
          case AsyncInitLoadingState.failed:
            return _StatusReplyFailedWidget();
            break;
        }

        throw "Invalid loadingState $loadingState";
      },
    );
  }

  Widget _buildStatusListItemTimelineWidget() {
    return DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
      update: (context, status, _) => StatusListItemTimelineBloc.list(
        status: status,
        collapsible: collapsible,
        isFirstReplyInThread: false,
        statusCallback: _onStatusClick,
        initialMediaAttachment: null,
      ),
      child: const StatusListItemTimelineWidget(),
    );
  }
}

class _StatusReplyFailedWidget extends StatelessWidget {
  const _StatusReplyFailedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Text(
        S.of(context).app_status_reply_loading_failed,
      ),
    );
  }
}

class _StatusReplyLoadingWidget extends StatelessWidget {
  const _StatusReplyLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          )
        ],
      ),
    );
  }
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
    goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
      context,
      remoteInstanceStatus: status,
      remoteInstanceInitialMediaAttachment: null,
    );
  }
}
