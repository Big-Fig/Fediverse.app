import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_widget.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineSettingsPage extends StatelessWidget {
  final Timeline originalTimeline;

  TimelineSettingsPage({@required this.originalTimeline});

  @override
  Widget build(BuildContext context) {
    var label = originalTimeline.label;

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.timeline.settings.title".tr(args: [label]),
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: FediAsyncInitLoadingWidget(
          asyncInitLoadingBloc: ITimelineLocalPreferencesBloc.of(
            context,
            listen: false,
          ),
          loadingFinishedBuilder: (context) => TimelineSettingsWidget(
            type: originalTimeline.type,
          ),
        ),
      ),
    );
  }
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
    builder: (context) => DisposableProvider<ITimelineLocalPreferencesBloc>(
      create: (context) {
        return TimelineLocalPreferencesBloc.byId(
          localPreferencesService,
          userAtHost: currentInstance.userAtHost,
          timelineId: timeline.id,
        );
      },
      child: DisposableProvider<ITimelineSettingsFormBloc>(
        create: (BuildContext context) {
          var timelineLocalPreferencesBloc = ITimelineLocalPreferencesBloc.of(
            context,
            listen: false,
          );
          var timelineSettingsBloc = TimelineSettingsFormBloc(
            originalSettings: timelineLocalPreferencesBloc.value?.settings,
          );
          return timelineSettingsBloc;
        },
        child: TimelineSettingsPage(
          originalTimeline: timeline,
        ),
      ),
    ),
  );
}
