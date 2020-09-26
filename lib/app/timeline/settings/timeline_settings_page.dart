import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/timeline/settings/local_preferences_timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_widget.dart';
import 'package:fedi/app/timeline/timeline_bloc.dart';
import 'package:fedi/app/timeline/timeline_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var label = ITimelineBloc.of(context, listen: false).label;

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.timeline.settings.title".tr(args: [label]),
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: FediAsyncInitLoadingWidget(
          asyncInitLoadingBloc: ITimelineSettingsLocalPreferencesBloc.of(
            context,
            listen: false,
          ),
          loadingFinishedBuilder: (context) => TimelineSettingsWidget(),
        ),
      ),
    );
  }

  const TimelineSettingsPage();
}

void goToTimelineSettingsPage(
  BuildContext context, {
  @required Timeline Timeline,
}) {
  Navigator.push(
    context,
    createTimelineSettingsPageRoute(
      context,
      timeline: Timeline,
    ),
  );
}

MaterialPageRoute createTimelineSettingsPageRoute(
  BuildContext context, {
  @required Timeline timeline,
}) {
  var localPreferencesService =
      ILocalPreferencesService.of(context, listen: false);
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  var currentInstance = currentAuthInstanceBloc.currentInstance;
  return MaterialPageRoute(
    builder: (context) =>
        DisposableProvider<ITimelineSettingsLocalPreferencesBloc>(
      create: (context) {
        return TimelineSettingsLocalPreferencesBloc.byId(
          localPreferencesService,
          userAtHost: currentInstance.userAtHost,
          timelineId: timeline.timelineSettingsId,
        );
      },
      child: DisposableProvider<ITimelineSettingsBloc>(
        create: (BuildContext context) {
          var timelineSettingsLocalPreferencesBloc =
              ITimelineSettingsLocalPreferencesBloc.of(
            context,
            listen: false,
          );
          return LocalPreferencesTimelineSettingsBloc(
            settingsLocalPreferencesBloc: timelineSettingsLocalPreferencesBloc,
            originalSettings: timelineSettingsLocalPreferencesBloc.value,
          );
        },
        child: DisposableProvider<ITimelineBloc>(
          create: (context) {
            return TimelineBloc(
              preferencesService: localPreferencesService,
              timeline: timeline,
              currentInstance: currentInstance,
            );
          },
          child: const TimelineSettingsPage(),
        ),
      ),
    ),
  );
}
