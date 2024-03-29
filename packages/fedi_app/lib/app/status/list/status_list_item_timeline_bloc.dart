import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IStatusListItemTimelineBloc implements IDisposable {
  static IStatusListItemTimelineBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusListItemTimelineBloc>(context, listen: listen);

  bool get isHaveReblog;

  bool get isDisplayActionsAndNotFirstReply;

  bool get isReplyAndNotDisplayReplyOrFirstReply;

  bool get isCommentsActionEnabled;

  StatusAndContextCallback? get statusCallback;

  AccountCallback? get accountMentionCallback;

  bool get displayActions;

  bool get displayAccountHeader;

  bool get displayThisThreadAction;

  bool get displayReplyToStatus;

  bool get isFirstReplyInThread;

  bool get isReply;

  bool get isReplyAndIsFirstReplyAndDisplayReplyToStatus;

  bool get collapsible;

  IUnifediApiMediaAttachment? get initialMediaAttachment;

  bool get isFirstReplyAndDisplayReplyToStatus;

  IStatus get status;

  bool get isReplyAndFirstReplyOrDisplayAllReplies;
}
