import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsBloc = ITimelinesSettingsBloc.of(context, listen: true);

    return ListView(
      children: [
        FormBoolFieldFormRowWidget(
          label: tr("app.timeline.display.settings.field.only_with_media"
              ".label"),
          field: settingsBloc.onlyWithMediaFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: tr("app.timeline.display.settings.field.hide_replies.label"),
          field: settingsBloc.onlyNoRepliesFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: tr("app.timeline.display.settings.field.hide_nsfw.label"),
          field: settingsBloc.onlyNoNsfwSensitiveFieldBloc,
        ),
      ],
    );
  }

  const TimelinesSettingsWidget();
}
