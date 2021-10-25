import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/settings/settings_dialog.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi_app/app/timeline/settings/edit/edit_timeline_settings_bloc_impl.dart';
import 'package:fedi_app/app/timeline/settings/edit/edit_timeline_settings_widget.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi_app/app/timeline/timeline_label_extension.dart';
import 'package:fedi_app/app/timeline/timeline_model.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

void showEditTimelineSettingsDialog({
  required BuildContext context,
  required Timeline timeline,
  required bool lockedSource,
  required IUnifediApiInstance unifediApiInstance,
  required InstanceLocation instanceLocation,
}) {
  showEditTimelineLocalPreferenceBlocSettingsDialog(
    context: context,
    timeline: timeline,
    timelineLocalPreferenceBloc: _createTimelinePreferencesBloc(
      context,
      timeline,
    ),
    lockedSource: lockedSource,
    unifediApiInstance: unifediApiInstance,
    instanceLocation: instanceLocation,
  );
}

void showEditTimelineLocalPreferenceBlocSettingsDialog({
  required BuildContext context,
  required Timeline timeline,
  required bool lockedSource,
  required IUnifediApiInstance unifediApiInstance,
  required ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc,
  required InstanceLocation instanceLocation,
}) {
  showSettingsDialog(
    context: context,
    title: S.of(context).app_timeline_settings_title,
    subTitle: S.of(context).app_timeline_settings_content(
          timeline.calculateLabel(context),
        ),
    child: Provider<Timeline>.value(
      value: timeline,
      child: Provider<ITimelineLocalPreferenceBlocOld>.value(
        value: timelineLocalPreferenceBloc,
        child: Builder(
          builder: (context) => FediAsyncInitLoadingWidget(
            asyncInitLoadingBloc:
                ITimelineLocalPreferenceBlocOld.of(context, listen: false),
            loadingFinishedBuilder: (context) => DisposableProxyProvider<
                ITimelineLocalPreferenceBlocOld, ITimelineSettingsBloc>(
              update: (context, timelineLocalPreferencesBloc, _) =>
                  TimelineSettingsBloc(
                timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
              ),
              child: DisposableProxyProvider<ITimelineSettingsBloc,
                  IEditTimelineSettingsBloc>(
                update: (context, timelineSettingsBloc, _) =>
                    EditTimelineSettingsBloc(
                  instanceLocation: instanceLocation,
                  timelineType: timeline.type,
                  isEnabled: true,
                  isNullableValuesPossible: false,
                  unifediApiInstance: unifediApiInstance,
                  settingsBloc: timelineSettingsBloc,
                  webSocketsSettingsBloc: IWebSocketsSettingsBloc.of(
                    context,
                    listen: false,
                  ),
                ),
                child: EditTimelineSettingsWidget(
                  shrinkWrap: true,
                  lockedSource: lockedSource,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

TimelineLocalPreferenceBloc _createTimelinePreferencesBloc(
  BuildContext context,
  Timeline timeline,
) {
  var localPreferencesService = ILocalPreferencesService.of(
    context,
    listen: false,
  );
  var currentUnifediApiAccessBloc =
      ICurrentAccessBloc.of(context, listen: false);
  var currentInstance = currentUnifediApiAccessBloc.currentInstance!;

  return TimelineLocalPreferenceBloc.byId(
    localPreferencesService,
    userAtHost: currentInstance.userAtHost,
    timelineId: timeline.id,
    defaultPreferenceValue: timeline,
  );
}
