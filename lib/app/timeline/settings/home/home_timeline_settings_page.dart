import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/timeline/settings/home/home_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/home/home_timeline_settings_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTimelineSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.timeline.display.settings.home.title"),
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: HomeTimelineSettingsWidget(),
      ),
    );
  }

  const HomeTimelineSettingsPage();
}

void goToHomeTimelineSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createHomeTimelineSettingsPageRoute(),
  );
}

MaterialPageRoute createHomeTimelineSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ITimelineSettingsBloc>(
      create: (BuildContext context) => TimelineSettingsBloc(
          settingsLocalPreferencesBloc:
              IHomeTimelineSettingsLocalPreferencesBloc.of(context,
                  listen: false)),
      child: const HomeTimelineSettingsPage(),
    ),
  );
}
