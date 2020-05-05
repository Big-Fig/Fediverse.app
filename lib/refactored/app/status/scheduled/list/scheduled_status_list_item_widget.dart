import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/refactored/app/status/scheduled/datetime/scheduled_status_datetime_picker_dialog.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/dialog/async/async_dialog.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

var _logger = Logger("scheduled_status_list_item_widget.dart");

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

class ScheduledStatusListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scheduledStatusBloc = IScheduledStatusBloc.of(context, listen: true);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildScheduledAt(context, scheduledStatusBloc),
            buildEditButton(context, scheduledStatusBloc),
            buildCancelButton(context, scheduledStatusBloc),
          ],
        ),
        DisposableProxyProvider<IScheduledStatusBloc, IStatusBloc>(
            update: (context, value, previous) => StatusBloc.createFromContext(
                context,
                ScheduledStatusAdapterToStatus(
                    scheduledStatus: value.scheduledStatus,
                    account:
                        IMyAccountBloc.of(context, listen: false).account)),
            child: StatusListItemTimelineWidget())
      ],
    );
  }

  Widget buildScheduledAt(
          BuildContext context, IScheduledStatusBloc scheduledStatusBloc) =>
      StreamBuilder<DateTime>(
          stream: scheduledStatusBloc.scheduledAtStream,
          initialData: scheduledStatusBloc.scheduledAt,
          builder: (context, snapshot) {
            var scheduledAt = snapshot.data;
            return Text(AppLocalizations.of(context).tr(
                "app status.scheduled"
                ".scheduled_at",
                args: [dateFormat.format(scheduledAt)]));
          });

  Widget buildCancelButton(
          BuildContext context, IScheduledStatusBloc scheduledStatusBloc) =>
      PleromaAsyncOperationButtonBuilderWidget(
        builder: (context, onPressed) {
          return FlatButton(
            onPressed: onPressed,
            child: Text(AppLocalizations.of(context)
                .tr("app.status.scheduled.action.cancel")),
          );
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
          doAsyncOperationWithDialog(
              context: context,
              asyncCode: () =>
                  scheduledStatusBloc.reSchedule(scheduledAt: newScheduledAt));
        }
      },
      child: Text(
          AppLocalizations.of(context).tr("app.status.scheduled.action.edit")),
    );
  }
}
