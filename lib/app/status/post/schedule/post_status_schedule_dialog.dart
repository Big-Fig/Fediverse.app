import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

void showPostStatusScheduleDialog({
  required BuildContext context,
  required IPostStatusBloc postStatusBloc,
}) async {
  // ignore: no-magic-number
  var approximateDurationForSelection = Duration(minutes: 2);
  var now = DateTime.now();

  var pickerTitle = S.of(context).app_status_scheduled_datetime_picker_title;

  var initialDate = now
      .add(IPostStatusBloc.requiredDurationToScheduleDateTime)
      .add(approximateDurationForSelection);

  bool deleted = false;
  bool canceled = false;

  DateTime? newTime = await FediDatePicker.showDateTimePicker(
    context,
    showTitleActions: true,
    minDateTime: now,
    maxDateTime: now.add(
      // ignore: no-magic-number
      Duration(days: 365),
    ),
    currentDateTime: postStatusBloc.scheduledAt ?? initialDate,
    theme: FediDatePickerTheme.byDefault(
      context: context,
      customTitle: pickerTitle,
    ),
    onCancel: () {
      canceled = true;
    },
    onDelete: () {
      deleted = true;
    },
    onConfirm: null,
    isDeletePossible: postStatusBloc.scheduledAt != null,
  );

  if (deleted) {
    postStatusBloc.setScheduledAt(null);
  // ignore: no-empty-block
  } else if (canceled) {
    // nothing
  } else {
    var minDateTimeToSchedule =
        now.add(IPostStatusBloc.requiredDurationToScheduleDateTime);
    if (newTime != null && newTime.isBefore(minDateTimeToSchedule)) {
      await FediSimpleAlertDialog(
        context: context,
        title: S
            .of(context)
            .app_status_post_schedule_error_notInFuture_dialog_title,
        contentText: S
            .of(context)
            .app_status_post_schedule_error_notInFuture_dialog_content,
      ).show(context);
    } else {
      postStatusBloc.setScheduledAt(newTime);
    }
  }
}
