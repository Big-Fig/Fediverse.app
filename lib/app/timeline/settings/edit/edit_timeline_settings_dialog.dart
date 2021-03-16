import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/settings/settings_dialog.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_label_extension.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditTimelineSettingsDialog({
  required BuildContext context,
  required Timeline timeline,
}) {
  showSettingsDialog(
    context: context,
    title: S.of(context).app_timeline_settings_title,
    subTitle: S.of(context).app_timeline_settings_content(
          timeline.calculateLabel(context)!,
        ),
    child: Provider<Timeline>.value(
      value: timeline,
      child: DisposableProxyProvider<Timeline, ITimelineLocalPreferencesBloc>(
        update: (context, timeline, _) {
          return _createTimelinePreferencesBloc(context, timeline);
        },
        child: Builder(
          builder: (context) => FediAsyncInitLoadingWidget(
            asyncInitLoadingBloc:
                ITimelineLocalPreferencesBloc.of(context, listen: false),
            loadingFinishedBuilder: (context) => DisposableProxyProvider<
                ITimelineLocalPreferencesBloc, ITimelineSettingsBloc>(
              update: (context, timelineLocalPreferencesBloc, _) =>
                  TimelineSettingsBloc(
                      timelineLocalPreferencesBloc:
                          timelineLocalPreferencesBloc),
              child: DisposableProxyProvider<ITimelineSettingsBloc,
                  IEditTimelineSettingsBloc>(
                update: (context, timelineSettingsBloc, _) =>
                    EditTimelineSettingsBloc(
                  timelineType: timeline.type,
                  isEnabled: true,
                  isNullableValuesPossible: false,
                  authInstance: ICurrentAuthInstanceBloc.of(
                    context,
                    listen: false,
                  ).currentInstance!,
                  settingsBloc: timelineSettingsBloc,
                  webSocketsSettingsBloc: IWebSocketsSettingsBloc.of(
                    context,
                    listen: false,
                  ),
                ),
                child: const EditTimelineSettingsWidget(
                  shrinkWrap: true,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

TimelineLocalPreferencesBloc _createTimelinePreferencesBloc(
    BuildContext context, Timeline timeline) {
  var localPreferencesService = ILocalPreferencesService.of(context);
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  var currentInstance = currentAuthInstanceBloc.currentInstance!;
  return TimelineLocalPreferencesBloc.byId(
    localPreferencesService,
    userAtHost: currentInstance.userAtHost,
    timelineId: timeline.id,
    defaultValue: timeline,
  );
}
