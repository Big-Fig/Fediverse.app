import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/scheduled/scheduled_edit_post_status_page.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/fedi_text_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final dateFormat = DateFormat('dd MMM, HH:mm a');

class ScheduledStatusListItemWidget extends StatelessWidget {
  final VoidCallback successCallback;

  const ScheduledStatusListItemWidget({
    Key? key,
    required this.successCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          _ScheduledStatusListItemHeaderWidget(
            successCallback: successCallback,
          ),
          const FediUltraLightGreyDivider(),
          ProxyProvider<IScheduledStatusBloc, IStatus>(
            update: (context, value, previous) =>
                ScheduledStatusAdapterToStatus(
              scheduledStatus: value.scheduledStatus,
              account: IMyAccountBloc.of(context, listen: false).account,
            ),
            child:
                DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
              update: (context, status, _) => StatusListItemTimelineBloc.list(
                status: status,
                displayActions: false,
                statusCallback: null,
                collapsible: false,
                initialMediaAttachment: null,
              ),
              child: const StatusListItemTimelineWidget(),
            ),
          ),
          const FediSmallVerticalSpacer(),
        ],
      );
}

class _ScheduledStatusListItemHeaderWidget extends StatelessWidget {
  const _ScheduledStatusListItemHeaderWidget({
    Key? key,
    required this.successCallback,
  }) : super(key: key);

  final VoidCallback successCallback;

  @override
  Widget build(BuildContext context) {
    var scheduledStatusBloc = IScheduledStatusBloc.of(context);

    return StreamBuilder<ScheduledStatusState?>(
      stream: scheduledStatusBloc.stateStream,
      builder: (context, snapshot) {
        var state = snapshot.data ?? ScheduledStatusState.scheduled;

        switch (state) {
          case ScheduledStatusState.scheduled:
            return _ScheduledStatusListItemScheduledHeaderWidget(
              successCallback: successCallback,
            );
          case ScheduledStatusState.canceled:
            return const _ScheduledStatusListItemCanceledHeaderWidget();
          case ScheduledStatusState.alreadyPosted:
            return const _ScheduledStatusListItemAlreadyPostedHeaderWidget();
        }
      },
    );
  }
}

class _ScheduledStatusListItemScheduledHeaderWidget extends StatelessWidget {
  const _ScheduledStatusListItemScheduledHeaderWidget({
    Key? key,
    required this.successCallback,
  }) : super(key: key);

  final VoidCallback successCallback;

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const _ScheduledStatusListItemScheduledAtWidget(),
            Row(
              children: [
                _ScheduledStatusListItemEditButtonWidget(
                  successCallback: successCallback,
                ),
                const _ScheduledStatusListItemCancelButtonWidget(),
              ],
            ),
          ],
        ),
      );
}

class _ScheduledStatusListItemScheduledAtWidget extends StatelessWidget {
  const _ScheduledStatusListItemScheduledAtWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scheduledStatusBloc = IScheduledStatusBloc.of(context);

    return StreamBuilder<DateTime?>(
      stream: scheduledStatusBloc.scheduledAtStream,
      initialData: scheduledStatusBloc.scheduledAt,
      builder: (context, snapshot) {
        var scheduledAt = snapshot.data!;

        return Text(
          dateFormat.format(scheduledAt),
          style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
        );
      },
    );
  }
}

class _ScheduledStatusListItemAlreadyPostedHeaderWidget
    extends StatelessWidget {
  const _ScheduledStatusListItemAlreadyPostedHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: FediPadding.allSmallPadding,
              child: Text(
                S.of(context).app_status_scheduled_state_alreadyPosted,
                style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
              ),
            ),
          ],
        ),
      );
}

class _ScheduledStatusListItemCanceledHeaderWidget extends StatelessWidget {
  const _ScheduledStatusListItemCanceledHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: FediPadding.allSmallPadding,
              child: Text(
                S.of(context).app_status_scheduled_state_canceled,
                style: IFediUiTextTheme.of(context).mediumShortBoldDarkGrey,
              ),
            ),
          ],
        ),
      );
}

class _ScheduledStatusListItemCancelButtonWidget extends StatelessWidget {
  const _ScheduledStatusListItemCancelButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scheduledStatusBloc = IScheduledStatusBloc.of(context);

    return UnifediAsyncOperationButtonBuilderWidget<void>(
      builder: (context, onPressed) => FediTextButton(
        text: S.of(context).app_account_my_statuses_draft_status_action_delete,
        color: IFediUiColorTheme.of(context).darkGrey,
        onPressed: onPressed,
      ),
      asyncButtonAction: () => scheduledStatusBloc.cancelSchedule(),
    );
  }
}

class _ScheduledStatusListItemEditButtonWidget extends StatelessWidget {
  const _ScheduledStatusListItemEditButtonWidget({
    Key? key,
    required this.successCallback,
  }) : super(key: key);

  final VoidCallback successCallback;

  @override
  Widget build(BuildContext context) {
    var scheduledStatusBloc = IScheduledStatusBloc.of(context);

    return FediTextButton(
      text: S.of(context).app_account_my_statuses_scheduled_status_action_edit,
      color: IFediUiColorTheme.of(context).darkGrey,
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
}
