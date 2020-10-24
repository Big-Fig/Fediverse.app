import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/account/status_account_widget.dart';
import 'package:fedi/app/status/action/status_actions_list_widget.dart';
import 'package:fedi/app/status/action/status_show_this_thread_action_widget.dart';
import 'package:fedi/app/status/body/status_body_widget.dart';
import 'package:fedi/app/status/created_at/status_created_at_widget.dart';
import 'package:fedi/app/status/deleted/status_deleted_overlay_widget.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_list_widget.dart';
import 'package:fedi/app/status/reblog/status_reblog_header_widget.dart';
import 'package:fedi/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi/app/status/reply/status_reply_loader_bloc_impl.dart';
import 'package:fedi/app/status/reply/status_reply_sub_header_widget.dart';
import 'package:fedi/app/status/reply/status_reply_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/visibility/status_visibility_icon_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_list_item_timeline_widget.dart");

class StatusListItemTimelineWidget extends StatelessWidget {
  final IStatusCallback statusCallback;
  final AccountCallback accountMentionCallback;
  final bool displayActions;
  final bool displayAccountHeader;
  final bool displayThisThreadAction;
  final bool displayReplyToStatus;
  final bool isFirstReplyInThread;
  final bool collapsible;
  final IPleromaMediaAttachment initialMediaAttachment;

  bool get isFirstReplyAndDisplayReplyToStatus =>
      (displayReplyToStatus && isFirstReplyInThread);

  StatusListItemTimelineWidget._private({
    @required this.collapsible,
    @required this.displayActions,
    @required this.displayAccountHeader,
    @required this.displayThisThreadAction,
    @required this.displayReplyToStatus,
    @required this.isFirstReplyInThread,
    @required this.accountMentionCallback,
    @required this.statusCallback,
    @required this.initialMediaAttachment,
  }) : super();

  static StatusListItemTimelineWidget list({
    @required bool collapsible,
    bool isFirstReplyInThread = true,
    bool displayActions = true,
    @required IStatusCallback statusCallback,
    @required IPleromaMediaAttachment initialMediaAttachment,
  }) =>
      StatusListItemTimelineWidget._private(
        collapsible: collapsible,
        statusCallback: statusCallback,
        isFirstReplyInThread: isFirstReplyInThread,
        displayActions: displayActions,
        displayReplyToStatus: true,
        displayThisThreadAction: true,
        displayAccountHeader: true,
        accountMentionCallback: null,
        initialMediaAttachment: initialMediaAttachment,
      );

  static StatusListItemTimelineWidget thread({
    @required bool collapsible,
    @required bool displayAccountHeader,
    @required bool displayActions,
    @required IStatusCallback statusCallback,
    @required AccountCallback accountMentionCallback,
    @required IPleromaMediaAttachment initialMediaAttachment,
  }) =>
      StatusListItemTimelineWidget._private(
        collapsible: collapsible,
        statusCallback: statusCallback,
        isFirstReplyInThread: false,
        displayActions: displayActions,
        displayReplyToStatus: false,
        displayThisThreadAction: false,
        accountMentionCallback: accountMentionCallback,
        displayAccountHeader: displayAccountHeader,
        initialMediaAttachment: initialMediaAttachment,
      );

  @override
  Widget build(BuildContext context) {
    var status = Provider.of<IStatus>(context, listen: false);

    if (status == null) {
      _logger.warning(() => "status is null");
      return SizedBox.shrink();
    }

    _logger.finest(() => "build status?.remoteId ${status.remoteId}");

    var isReply = status.isReply;

    Widget child;
    if (isReply && isFirstReplyAndDisplayReplyToStatus) {
      child = Column(
        children: [
          buildReplyToStatus(context),
          const FediUltraLightGreyDivider(),
          buildOriginalStatus(context, isReply),
        ],
      );
    } else {
      child = buildOriginalStatus(context, isReply);
    }
    return child;
  }

  Widget buildReplyToStatus(BuildContext context) {
    return DisposableProxyProvider<IStatus, IStatusReplyLoaderBloc>(
      update: (context, value, previous) {
        var statusReplyLoaderBloc =
            StatusReplyLoaderBloc.createFromContext(context, value);
        // don't await
        statusReplyLoaderBloc.performAsyncInit();
        return statusReplyLoaderBloc;
      },
      child: StatusReplyWidget(
        collapsible: collapsible,
      ),
    );
  }

  Widget buildDeletedStreamBuilderOverlay({
    @required Widget child,
    @required IStatusBloc statusBloc,
  }) {
    return StreamBuilder<bool>(
        stream: statusBloc.deletedStream.distinct(),
        initialData: statusBloc.deleted,
        builder: (context, snapshot) {
          var deleted = snapshot.data;

          if (deleted == true) {
            return StatusDeletedOverlayWidget(child: child);
          } else {
            return child;
          }
        });
  }

  Widget buildOriginalStatus(BuildContext context, bool isReply) {
    var status = Provider.of<IStatus>(context, listen: false);
    var isReplyAndFirstReplyOrDisplayAllReplies = isReply &&
        displayThisThreadAction &&
        isFirstReplyAndDisplayReplyToStatus;
    return DisposableProxyProvider<IStatus, IStatusBloc>(
      update: (context, status, oldValue) => _createStatusBloc(context, status),
      child: Builder(
        builder: (context) {
          var statusBloc = IStatusBloc.of(context, listen: false);
          return buildDeletedStreamBuilderOverlay(
            statusBloc: statusBloc,
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (statusCallback != null) {
                      var statusBloc = IStatusBloc.of(context, listen: false);
                      statusCallback(context, statusBloc.status);
                    }
                  },
                  child: Column(
                    children: [
                      if (status.isHaveReblog) StatusReblogHeaderWidget(),
                      if (displayAccountHeader)
                        buildStatusHeader(context, status),
                      if (isReply)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              FediSizes.bigPadding + 52.0,
                              FediSizes.smallPadding,
                              FediSizes.bigPadding,
                              0.0),
                          child: StatusReplySubHeaderWidget(
                            accountCallback: accountMentionCallback,
                          ),
                        ),
                      buildBody(isReply),
                      StatusEmojiReactionListWidget(),
                    ],
                  ),
                ),
                if (displayActions &&
                    !(isReply && isFirstReplyAndDisplayReplyToStatus))
                  StatusActionsListWidget(),
                if (isReplyAndFirstReplyOrDisplayAllReplies)
                  Column(
                    children: [
                      const FediUltraLightGreyDivider(),
                      StatusShowThisThreadActionWidget(),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildStatusHeader(BuildContext context, IStatus status) => Padding(
        padding: const EdgeInsets.fromLTRB(FediSizes.bigPadding,
            FediSizes.bigPadding, FediSizes.bigPadding, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(child: StatusAccountWidget()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  StatusVisibilityIconWidget.mapVisibilityToIconData(
                    status.visibility,
                  ),
                  size: FediSizes.mediumIconSize,
                  color: IFediUiColorTheme.of(context).darkGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: FediSizes.smallPadding),
                  child: StatusCreatedAtWidget(),
                ),
              ],
            ),
          ],
        ),
      );

  StatusBloc _createStatusBloc(BuildContext context, IStatus status) {
    var statusBloc = StatusBloc.createFromContext(context, status);

    if (collapsible) {
      var collapsibleBloc = ICollapsibleBloc.of(context, listen: false);
      collapsibleBloc.addVisibleItem(statusBloc);
      statusBloc.addDisposable(disposable: CustomDisposable(() async {
        await collapsibleBloc.removeVisibleItem(statusBloc);
      }));
    }

    return statusBloc;
  }

  Padding buildBody(bool isReply) {
    if (isReply && (!displayReplyToStatus || isFirstReplyInThread)) {
      return Padding(
        padding: EdgeInsets.fromLTRB(68.0 - FediSizes.bigPadding,
            FediSizes.smallPadding, 0.0, FediSizes.bigPadding),
        child: StatusBodyWidget(
          collapsible: collapsible,
          initialMediaAttachment: initialMediaAttachment,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: FediSizes.smallPadding),
        child: StatusBodyWidget(
          collapsible: collapsible,
          initialMediaAttachment: initialMediaAttachment,
        ),
      );
    }
  }
}
