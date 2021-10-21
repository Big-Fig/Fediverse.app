import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/action/status_action_counter_widget.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/thread/local_status_thread_page.dart';
import 'package:fedi/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusCommentActionWidget extends StatelessWidget {
  const StatusCommentActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: const <Widget>[
          _StatusCommentActionButtonWidget(),
          _StatusCommentActionCounterWidget(),
        ],
      );
}

class _StatusCommentActionCounterWidget extends StatelessWidget {
  const _StatusCommentActionCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    var statusListItemTimelineBloc = IStatusListItemTimelineBloc.of(context);

    return StreamBuilder<int?>(
      stream: statusBloc.repliesCountStream,
      builder: (context, snapshot) {
        var repliesCount = snapshot.data;
        if (repliesCount == null) {
          return const SizedBox.shrink();
        }

        return Provider<int>.value(
          value: repliesCount,
          child: StatusActionCounterWidget(
            onClick: statusListItemTimelineBloc.isCommentsActionEnabled
                ? _onActionClick
                : null,
          ),
        );
      },
    );
  }
}

Future<void> _onActionClick(BuildContext context) {
  var statusBloc = IStatusBloc.of(context, listen: false);
  var isLocal = statusBloc.instanceLocation == InstanceLocation.local;

  if (isLocal) {
    return goToLocalStatusThreadPage(
      context,
      status: statusBloc.status,
      initialMediaAttachment: null,
    );
  } else {
    return goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
      context,
      remoteInstanceStatus: statusBloc.status,
      remoteInstanceInitialMediaAttachment: null,
    );
  }
}

class _StatusCommentActionButtonWidget extends StatelessWidget {
  const _StatusCommentActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusListItemTimelineBloc = IStatusListItemTimelineBloc.of(context);

    return FediIconButton(
      color: statusListItemTimelineBloc.isCommentsActionEnabled
          ? IFediUiColorTheme.of(context).darkGrey
          : IFediUiColorTheme.of(context).lightGrey,
      iconSize: FediSizes.bigIconSize,
      icon: const Icon(FediIcons.message),
      onPressed: statusListItemTimelineBloc.isCommentsActionEnabled
          ? () {
              _onActionClick(context);
            }
          : null,
    );
  }
}
