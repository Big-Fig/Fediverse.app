import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_widget.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showTimelineSettingsDialog({
  @required BuildContext context,
  @required Timeline timeline,
}) {
  showFediModalBottomSheetDialog(
    context: context,
    child: Provider<Timeline>.value(
      value: timeline,
      child: DisposableProxyProvider<Timeline, ITimelineLocalPreferencesBloc>(
        update: (context, timeline, _) {
          return _createTimelinePreferencesBloc(context, timeline);
        },
        child: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(
              vertical: FediSizes.smallPadding,
              horizontal: FediSizes.bigPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).app_timeline_settings_title,
                  style: IFediUiTextTheme.of(context).subHeaderTallBoldDarkGrey,
                ),
                Text(
                  S.of(context).app_timeline_settings_content(timeline.label),
                  style: IFediUiTextTheme.of(context).bigTallDarkGrey,
                ),
                const FediBigVerticalSpacer(),
                const FediUltraLightGreyDivider(),
                const FediSmallVerticalSpacer(),
                FediAsyncInitLoadingWidget(
                  asyncInitLoadingBloc:
                      ITimelineLocalPreferencesBloc.of(context, listen: false),
                  loadingFinishedBuilder: (context) => DisposableProxyProvider<
                      Timeline, ITimelineSettingsFormBloc>(
                    update: (context, timeline, _) {
                      var timelineLocalPreferencesBloc =
                          ITimelineLocalPreferencesBloc.of(
                        context,
                        listen: false,
                      );
                      TimelineSettingsFormBloc timelineSettingsBloc =
                          _createTimelineSettingsFormBloc(
                              timelineLocalPreferencesBloc, timeline);

                      _setupTimelinePreferencesChangesListener(
                          timelineSettingsBloc, timelineLocalPreferencesBloc);
                      return timelineSettingsBloc;
                    },
                    child: TimelineSettingsWidget(
                      type: timeline.type,
                      isNullablePossible: false,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
//
// class TimelineSettingsDialog extends StatelessWidget {
//   const TimelineSettingsDialog();
//
//   @override
//   Widget build(BuildContext context) {
//     return FediChooserDialogBody(
//       title: S.of(context).app_timeline_settings_title,
//       content: S.of(context).app_timeline_settings_content(),
//       actions: loadingActions
//           ? []
//           : [
//         AccountActionMoreDialog.buildAccountOpenInBrowserAction(
//             context),
//         AccountActionMoreDialog.buildAccountMuteAction(context),
//         AccountActionMoreDialog.buildAccountBlockAction(context),
//         if (accountBloc.isOnRemoteDomain)
//           AccountActionMoreDialog.buildAccountBlockDomainAction(
//               context),
//         AccountActionMoreDialog.buildAccountReportAction(context),
//       ],
//       loadingActions: loadingActions,
//       cancelable: cancelable,
//     );
//   }
// }

// class TimelineSettingsPage extends StatelessWidget {
//   const TimelineSettingsPage();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const _TimelineSettingsPageAppBar(),
//       body: Padding(
//         padding: FediPadding.allBigPadding,
//         child: FediAsyncInitLoadingWidget(
//           asyncInitLoadingBloc: ITimelineLocalPreferencesBloc.of(
//             context,
//             listen: false,
//           ),
//           loadingFinishedBuilder: (context) {
//             var timeline = Provider.of<Timeline>(context);
//             return TimelineSettingsWidget(
//               isNullablePossible: false,
//               type: timeline.type,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class _TimelineSettingsPageAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   const _TimelineSettingsPageAppBar({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var timeline = Provider.of<Timeline>(context);
//
//     return FediSubPageTitleAppBar(
//       title: S.of(context).app_timeline_settings_title(timeline.label),
//     );
//   }
//
//   @override
//   Size get preferredSize => FediSubPageTitleAppBar.calculatePreferredSize();
// }
//
// void goToTimelineSettingsPage(
//   BuildContext context, {
//   @required Timeline timeline,
// }) {
//   Navigator.push(
//     context,
//     createTimelineSettingsPageRoute(
//       context,
//       timeline: timeline,
//     ),
//   );
// }
//
// MaterialPageRoute createTimelineSettingsPageRoute(
//   BuildContext context, {
//   @required Timeline timeline,
// }) {
//   assert(timeline != null);
//
//   return MaterialPageRoute(
//     builder: (context) => Provider<Timeline>.value(
//       value: timeline,
//       child: DisposableProxyProvider<Timeline, ITimelineLocalPreferencesBloc>(
//         update: (context, timeline, _) {
//           return _createTimelinePreferencesBloc(context, timeline);
//         },
//         child: Builder(
//           builder: (context) => FediAsyncInitLoadingWidget(
//             asyncInitLoadingBloc:
//                 ITimelineLocalPreferencesBloc.of(context, listen: false),
//             loadingFinishedBuilder: (context) =>
//                 DisposableProxyProvider<Timeline, ITimelineSettingsFormBloc>(
//               update: (context, timeline, _) {
//                 var timelineLocalPreferencesBloc =
//                     ITimelineLocalPreferencesBloc.of(
//                   context,
//                   listen: false,
//                 );
//                 TimelineSettingsFormBloc timelineSettingsBloc =
//                     _createTimelineSettingsFormBloc(
//                         timelineLocalPreferencesBloc, timeline);
//
//                 _setupTimelinePreferencesChangesListener(
//                     timelineSettingsBloc, timelineLocalPreferencesBloc);
//                 return timelineSettingsBloc;
//               },
//               child: const TimelineSettingsPage(),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

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

void _setupTimelinePreferencesChangesListener(
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
