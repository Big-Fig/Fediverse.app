import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTimelineSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsBloc = ITimelineSettingsBloc.of(context, listen: true);

    return ListView(
      children: [
        FormBoolFieldFormRowWidget(
          label: tr("app.timeline.display.settings.field.with_muted.label"),
          field: settingsBloc.withMutedFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: tr("app.timeline.display.settings.field.only_local"
              ".label"),
          field: settingsBloc.onlyLocalFieldBloc,
        ),
      ],
    );
  }

  const HomeTimelineSettingsWidget();
}
