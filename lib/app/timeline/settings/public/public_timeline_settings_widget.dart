import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublicTimelineSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsBloc = ITimelineSettingsBloc.of(context, listen: true);

    return ListView(
      children: [
        FormBoolFieldFormRowWidget(
          label: tr("app.timeline.display.settings.field.only_not_muted"
              ".label"),
          field: settingsBloc.onlyNotMutedFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: tr("app.timeline.display.settings.field.only_with_media"
              ".label"),
          field: settingsBloc.onlyWithMediaFieldBloc,
        ),
      ],
    );
  }

  const PublicTimelineSettingsWidget();
}
