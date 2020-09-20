import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/timeline/settings/home/home_timeline_settings_widget.dart';
import 'package:fedi/app/timeline/settings/local/local_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/local/local_timeline_settings_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalTimelineSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.timeline.display.settings.local.title"),
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: LocalTimelineSettingsWidget(),
      ),
    );
  }

  const LocalTimelineSettingsPage();
}

void goToLocalTimelineSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createLocalTimelineSettingsPageRoute(),
  );
}

MaterialPageRoute createLocalTimelineSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ITimelineSettingsBloc>(
      create: (BuildContext context) => TimelineSettingsBloc(
          settingsLocalPreferencesBloc:
              ILocalTimelineSettingsLocalPreferencesBloc.of(context,
                  listen: false)),
      child: const LocalTimelineSettingsPage(),
    ),
  );
}
