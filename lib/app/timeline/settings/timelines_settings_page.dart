import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.timeline.display.settings"
            ".title"),
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: TimelinesSettingsWidget(),
      ),
    );
  }

  const TimelinesSettingsPage();
}

void goTimelinesSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createTimelinesSettingsPageRoute(),
  );
}

MaterialPageRoute createTimelinesSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ITimelinesSettingsBloc>(
      create: (BuildContext context) => TimelinesSettingsBloc(
          localPreferencesBloc:
              ITimelineSettingsLocalPreferencesBloc.of(context, listen: false)),
      child: const TimelinesSettingsPage(),
    ),
  );
}
