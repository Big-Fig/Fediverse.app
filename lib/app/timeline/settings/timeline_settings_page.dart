import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_bloc.dart';
import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var label = ITimelinesHomeTabItemBloc.of(context, listen: false).label;

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.timeline.settings.title".tr(args: [label]),
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: TimelineSettingsWidget(),
      ),
    );
  }

  const TimelineSettingsPage();
}

void goToTimelineSettingsPage(
  BuildContext context, {
  @required ITimelineSettingsLocalPreferencesBloc settingsBloc,
  @required TimelinesHomeTabItem timelinesHomeTabItem,
}) {
  Navigator.push(
    context,
    createTimelineSettingsPageRoute(
      context,
      settingsBloc: settingsBloc,
      timelinesHomeTabItem: timelinesHomeTabItem,
    ),
  );
}

MaterialPageRoute createTimelineSettingsPageRoute(
  BuildContext context, {
  @required ITimelineSettingsLocalPreferencesBloc settingsBloc,
  @required TimelinesHomeTabItem timelinesHomeTabItem,
}) {
  var localPreferencesService =
      ILocalPreferencesService.of(context, listen: false);
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ITimelineSettingsBloc>(
      create: (BuildContext context) => TimelineSettingsBloc(
        settingsLocalPreferencesBloc: settingsBloc,
      ),
      child: DisposableProvider<ITimelinesHomeTabItemBloc>(
        create: (context) => TimelinesHomeTabItemBloc(
          preferencesService: localPreferencesService,
          timelinesHomeTabItem: timelinesHomeTabItem,
          currentInstance: currentAuthInstanceBloc.currentInstance,
        ),
        child: const TimelineSettingsPage(),
      ),
    ),
  );
}
