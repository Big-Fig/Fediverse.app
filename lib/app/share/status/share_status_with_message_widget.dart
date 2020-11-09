import 'package:fedi/app/share/share_with_message_widget.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class ShareStatusWithMessageWidget extends StatelessWidget {
  final Widget footer;

  const ShareStatusWithMessageWidget({
    @required this.footer,
  });

  @override
  Widget build(BuildContext context) => ShareWithMessageWidget(
        child: DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
          update: (context, status, _) => StatusListItemTimelineBloc.list(
            status: status,
            collapsible: false,
            displayActions: false,
            statusCallback: (BuildContext context, IStatus status) {
              goToStatusThreadPage(
                context,
                status: status,
                initialMediaAttachment: null,
              );
            },
            initialMediaAttachment: null,
          ),
          child: const StatusListItemTimelineWidget(),
        ),
        footer: footer,
      );
}
