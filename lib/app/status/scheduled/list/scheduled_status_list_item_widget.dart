import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/scheduled/datetime/scheduled_status_datetime_picker_dialog.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

class ScheduledStatusListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scheduledStatusBloc = IScheduledStatusBloc.of(context, listen: true);

    return Card(
      child: Column(
        children: <Widget>[
          buildScheduledHeader(context, scheduledStatusBloc),
          ProxyProvider<IScheduledStatusBloc, IStatus>(
              update: (context, value, previous) =>
                  ScheduledStatusAdapterToStatus(
                      scheduledStatus: value.scheduledStatus,
                      account:
                          IMyAccountBloc.of(context, listen: false).account),
              child: StatusListItemTimelineWidget.list(
                displayActions: false,
                statusCallback: (_, __) {
                  // nothing
                },
                collapsible: false,
              ))
        ],
      ),
    );
  }

  Widget buildScheduledHeader(
      BuildContext context, IScheduledStatusBloc scheduledStatusBloc) {
    return StreamBuilder<ScheduledStatusState>(
        stream: scheduledStatusBloc.stateStream,
        initialData: scheduledStatusBloc.state,
        builder: (context, snapshot) {
          var state = snapshot.data;

          switch (state) {
            case ScheduledStatusState.scheduled:
              return Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildScheduledAt(context, scheduledStatusBloc),
                      Row(children: [
                        buildEditButton(context, scheduledStatusBloc),
                        buildCancelButton(context, scheduledStatusBloc),
                      ],)
                    ],
                  ),
                ),
              );
              break;
            case ScheduledStatusState.canceled:
              return Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Padding(
                    padding: FediPadding.horizontalSmallPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: FediPadding.allSmallPadding,
                          child: Text(
                            tr("app.status.scheduled.state.canceled"),
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )),
              );
              break;
            case ScheduledStatusState.alreadyPosted:
              return Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                    padding: FediPadding.horizontalSmallPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: FediPadding.allSmallPadding,
                          child: Text(
                              tr(
                                  "app.status.scheduled.state.already_posted"),
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    )),
              );
          }

          throw "Invalid state $state";
        });
  }

  Widget buildScheduledAt(
          BuildContext context, IScheduledStatusBloc scheduledStatusBloc) =>
      StreamBuilder<DateTime>(
          stream: scheduledStatusBloc.scheduledAtStream,
          initialData: scheduledStatusBloc.scheduledAt,
          builder: (context, snapshot) {
            var scheduledAt = snapshot.data;
            return Text(
                tr(
                    "app.status.scheduled.state.scheduled_at",
                    args: [dateFormat.format(scheduledAt)]),
                style: TextStyle(color: Colors.white));
          });

  Widget buildCancelButton(
          BuildContext context, IScheduledStatusBloc scheduledStatusBloc) =>
      PleromaAsyncOperationButtonBuilderWidget(
        builder: (context, onPressed) {
          return FlatButton(
              onPressed: onPressed,
              child: Text(
                  tr("app.status.scheduled.action.cancel"),
                  style: TextStyle(color: Colors.white)));
        },
        asyncButtonAction: () => scheduledStatusBloc.cancelSchedule(),
      );

  Widget buildEditButton(
      BuildContext context, IScheduledStatusBloc scheduledStatusBloc) {
    return FlatButton(
        onPressed: () async {
          var newScheduledAt = await showScheduledStatusDateTimePickerDialog(
              context, scheduledStatusBloc.scheduledAt);

          if (newScheduledAt != null) {
            await doAsyncOperationWithDialog(
                context: context,
                asyncCode: () => scheduledStatusBloc.reSchedule(
                    scheduledAt: newScheduledAt));
          }
        },
        child: Text(
            tr("app.status.scheduled.action.edit"),
            style: TextStyle(color: Colors.white)));
  }
}
