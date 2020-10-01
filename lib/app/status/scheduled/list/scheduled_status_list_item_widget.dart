import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/scheduled/scheduled_edit_post_status_page.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final dateFormat = DateFormat("dd MMM, HH:mm a");

class ScheduledStatusListItemWidget extends StatelessWidget {
  final VoidCallback successCallback;

  ScheduledStatusListItemWidget({
    @required this.successCallback,
  });

  @override
  Widget build(BuildContext context) {
    var scheduledStatusBloc = IScheduledStatusBloc.of(context, listen: true);

    return Column(
      children: <Widget>[
        buildScheduledHeader(context, scheduledStatusBloc),
        FediUltraLightGreyDivider(),
        ProxyProvider<IScheduledStatusBloc, IStatus>(
            update: (context, value, previous) =>
                ScheduledStatusAdapterToStatus(
                    scheduledStatus: value.scheduledStatus,
                    account: IMyAccountBloc.of(context, listen: false).account),
            child: StatusListItemTimelineWidget.list(
              displayActions: false,
              statusCallback: (_, __) {
                // nothing
              },
              collapsible: false,
              initialMediaAttachment: null,
            ))
      ],
    );
  }

  Widget buildScheduledHeader(
      BuildContext context, IScheduledStatusBloc scheduledStatusBloc) {
    return StreamBuilder<ScheduledStatusState>(
        stream: scheduledStatusBloc.stateStream,
        initialData: scheduledStatusBloc.state,
        builder: (context, snapshot) {
          var state = snapshot.data;

          switch (state) {
            case ScheduledStatusState.scheduled:
              return Padding(
                padding: FediPadding.horizontalSmallPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildScheduledAt(context, scheduledStatusBloc),
                    Row(
                      children: [
                        buildEditButton(context, scheduledStatusBloc),
                        buildCancelButton(context, scheduledStatusBloc),
                      ],
                    )
                  ],
                ),
              );
              break;
            case ScheduledStatusState.canceled:
              return Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: FediPadding.allSmallPadding,
                        child: Text(
                          tr("app.status.scheduled.state.canceled"),
                          style: FediTextStyles.mediumShortBoldDarkGrey,
                        ),
                      )
                    ],
                  ));
              break;
            case ScheduledStatusState.alreadyPosted:
              return Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: FediPadding.allSmallPadding,
                        child: Text(
                          tr("app.status.scheduled.state.already_posted"),
                          style: FediTextStyles.mediumShortBoldDarkGrey,
                        ),
                      )
                    ],
                  ));
          }

          throw "Invalid state $state";
        });
  }

  Widget buildScheduledAt(
          BuildContext context, IScheduledStatusBloc scheduledStatusBloc) =>
      StreamBuilder<DateTime>(
          stream: scheduledStatusBloc.scheduledAtStream,
          initialData: scheduledStatusBloc.scheduledAt,
          builder: (context, snapshot) {
            var scheduledAt = snapshot.data;
            return Text(
              dateFormat.format(scheduledAt),
              style: FediTextStyles.mediumShortBoldDarkGrey,
            );
          });

  Widget buildCancelButton(
          BuildContext context, IScheduledStatusBloc scheduledStatusBloc) =>
      PleromaAsyncOperationButtonBuilderWidget(
        builder: (context, onPressed) => IconButton(
            icon: Icon(
              FediIcons.delete,
              color: FediColors.darkGrey,
            ),
            iconSize: FediSizes.bigIconSize,
            onPressed: onPressed),
        asyncButtonAction: () => scheduledStatusBloc.cancelSchedule(),
      );

  Widget buildEditButton(
          BuildContext context, IScheduledStatusBloc scheduledStatusBloc) =>
      IconButton(
        icon: Icon(
          FediIcons.pen,
          color: FediColors.darkGrey,
        ),
        iconSize: FediSizes.bigIconSize,
        onPressed: () async {
          var postStatusData = scheduledStatusBloc.calculatePostStatusData();
          goToScheduledEditPostStatusPage(
            context,
            initialData: postStatusData,
            successCallback: successCallback,
          );
        },
      );
}
