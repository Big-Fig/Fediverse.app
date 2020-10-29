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
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineSettingsPage extends StatelessWidget {
  const TimelineSettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _TimelineSettingsPageAppBar(),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: FediAsyncInitLoadingWidget(
          asyncInitLoadingBloc: ITimelineLocalPreferencesBloc.of(
            context,
            listen: false,
          ),
          loadingFinishedBuilder: (context) {
            var timeline = Provider.of<Timeline>(context);
            return TimelineSettingsWidget(
              isNullablePossible: false,
              type: timeline.type,
            );
          },
        ),
      ),
    );
  }
}

class _TimelineSettingsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _TimelineSettingsPageAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeline = Provider.of<Timeline>(context);

    return FediSubPageTitleAppBar(
      title: S.of(context).app_timeline_settings_title(timeline.label),
    );
  }

  @override
  Size get preferredSize => FediSubPageTitleAppBar.calculatePreferredSize();
}

void goToTimelineSettingsPage(
  BuildContext context, {
  @required Timeline timeline,
}) {
  Navigator.push(
    context,
    createTimelineSettingsPageRoute(
      context,
      timeline: timeline,
    ),
  );
}

MaterialPageRoute createTimelineSettingsPageRoute(
  BuildContext context, {
  @required Timeline timeline,
}) {
  assert(timeline != null);

  return MaterialPageRoute(
    builder: (context) => Provider<Timeline>.value(
      value: timeline,
      child: DisposableProxyProvider<Timeline, ITimelineLocalPreferencesBloc>(
        update: (context, timeline, _) {
          return _createTimelinePreferencesBloc(context, timeline);
        },
        child: Builder(
          builder: (context) => FediAsyncInitLoadingWidget(
            asyncInitLoadingBloc:
                ITimelineLocalPreferencesBloc.of(context, listen: false),
            loadingFinishedBuilder: (context) =>
                DisposableProxyProvider<Timeline, ITimelineSettingsFormBloc>(
              update: (context, timeline, _) {
                var timelineLocalPreferencesBloc =
                    ITimelineLocalPreferencesBloc.of(
                  context,
                  listen: false,
                );
                TimelineSettingsFormBloc timelineSettingsBloc =
                    _createTimelineSettingsFormBloc(
                        timelineLocalPreferencesBloc, timeline);

                _setupTimelinePrefencesChangesListener(
                    timelineSettingsBloc, timelineLocalPreferencesBloc);
                return timelineSettingsBloc;
              },
              child: const TimelineSettingsPage(),
            ),
          ),
        ),
      ),
    ),
  );
}

TimelineSettingsFormBloc _createTimelineSettingsFormBloc(
    ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc,
    Timeline timeline) {
  var currentTimeline = timelineLocalPreferencesBloc.value ?? timeline;
  var timelineSettingsBloc = TimelineSettingsFormBloc(
    originalSettings: currentTimeline?.settings,
    type: currentTimeline.type,
  );
  return timelineSettingsBloc;
}

TimelineLocalPreferencesBloc _createTimelinePreferencesBloc(
    BuildContext context, Timeline timeline) {
  var localPreferencesService = ILocalPreferencesService.of(context);
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  var currentInstance = currentAuthInstanceBloc.currentInstance;
  return TimelineLocalPreferencesBloc.byId(
    localPreferencesService,
    userAtHost: currentInstance.userAtHost,
    timelineId: timeline.id,
    defaultValue: timeline,
  );
}

void _setupTimelinePrefencesChangesListener(
    TimelineSettingsFormBloc timelineSettingsBloc,
    ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc) {
  timelineSettingsBloc.addDisposable(
    streamSubscription: timelineSettingsBloc.timelineSettingsStream.listen(
      (timelineSettings) {
        var oldValue = timelineLocalPreferencesBloc.value;
        timelineLocalPreferencesBloc.setValue(
          oldValue.copyWith(
            settings: timelineSettings,
          ),
        );
      },
    ),
  );
}
