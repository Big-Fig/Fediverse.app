import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_widget.dart';
import 'package:fedi/app/ui/drawer/fedi_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesHomeTabPageDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FediDrawerWidget(
      headerText: tr("app.timeline.display.settings"
          ".title"),
      child: TimelinesSettingsWidget(),
    );
  }

  const TimelinesHomeTabPageDrawerWidget();
}
