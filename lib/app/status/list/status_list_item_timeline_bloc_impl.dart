import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';

class StatusListItemTimelineBloc extends DisposableOwner
    implements IStatusListItemTimelineBloc {
  @override
  final IStatus status;

  @override
  bool get isDisplayActionsAndNotFirstReply =>
      displayActions && !(isReply && isFirstReplyAndDisplayReplyToStatus);

  @override
  bool get isReplyAndNotDisplayReplyOrFirstReply =>
      isReply && (!displayReplyToStatus || isFirstReplyInThread);

  @override
  final StatusAndContextCallback statusCallback;
  @override
  final AccountCallback accountMentionCallback;
  @override
  final bool displayActions;
  @override
  final bool displayAccountHeader;
  @override
  final bool displayThisThreadAction;
  @override
  final bool displayReplyToStatus;
  @override
  final bool isFirstReplyInThread;
  @override
  final bool collapsible;
  @override
  final IPleromaMediaAttachment initialMediaAttachment;

  @override
  bool get isReplyAndFirstReplyOrDisplayAllReplies =>
      isReply && displayThisThreadAction && isFirstReplyAndDisplayReplyToStatus;

  @override
  bool get isFirstReplyAndDisplayReplyToStatus =>
      (displayReplyToStatus && isFirstReplyInThread);

  @override
  bool get isReplyAndIsFirstReplyAndDisplayReplyToStatus =>
      isReply && isFirstReplyInThread && displayReplyToStatus;

  StatusListItemTimelineBloc._private({
    @required this.status,
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

  StatusListItemTimelineBloc.list({
    @required IStatus status,
    @required bool collapsible,
    bool isFirstReplyInThread = true,
    bool displayActions = true,
    @required StatusAndContextCallback statusCallback,
    @required IPleromaMediaAttachment initialMediaAttachment,
  }) : this._private(
          status: status,
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

  StatusListItemTimelineBloc.thread({
    @required IStatus status,
    @required bool collapsible,
    @required bool displayAccountHeader,
    @required bool displayActions,
    @required StatusAndContextCallback statusCallback,
    @required AccountCallback accountMentionCallback,
    @required IPleromaMediaAttachment initialMediaAttachment,
  }) : this._private(
          status: status,
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
  bool get isHaveReblog => status.isHaveReblog;

  @override
  bool get isReply => status.isReply;
}
