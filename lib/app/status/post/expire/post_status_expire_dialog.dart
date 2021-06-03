import 'package:fedi/app/status/expire/status_expire_duration_picker_dialog.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showPostStatusExpireDialog({
  required BuildContext context,
  required IPostStatusBloc postStatusBloc,
}) async {
  var newDuration = await showStatusExpireDurationPickerDialog(
    context: context,
    oldValue: postStatusBloc.expireDuration,
    pickerTitle: S.of(context).app_status_expire_datetime_picker_title,
  );

  postStatusBloc.setExpireDuration(newDuration);
}
