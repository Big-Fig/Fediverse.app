import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
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
              return _buildLoading(context);
              break;
            case AsyncInitLoadingState.finished:
              return Provider.value(
                  value: statusReplyLoaderBloc.inReplyToStatus,
                  child: StatusListItemTimelineWidget.list(
                    collapsible: collapsible,
                    isFirstReplyInThread: false,
                  ));
              break;
            case AsyncInitLoadingState.failed:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tr("app.status.reply.loading.failed"),
                ),
              );
              break;
          }

          throw "Invalid loadingState $loadingState";
        });
  }

  Padding _buildLoading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tr("app.status.reply.loading.progress"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FediCircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
