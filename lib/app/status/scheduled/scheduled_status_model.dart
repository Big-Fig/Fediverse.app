import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/post/post_status_data_status_status_adapter.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';

abstract class IScheduledStatus {
  int? get localId;

  String? get remoteId;

  DateTime get scheduledAt;

  IPleromaScheduledStatusParams get params;

  List<PleromaMediaAttachment>? get mediaAttachments;

  bool get canceled;

  IScheduledStatus copyWith({
    int? localId,
    String? remoteId,
    DateTime? scheduledAt,
    IPleromaScheduledStatusParams? params,
    bool? canceled,
    List<PleromaMediaAttachment>? mediaAttachments,
  });
}

extension IPleromaScheduledStatusParamsExtension
    on IPleromaScheduledStatusParams {
  PleromaScheduledStatusParams toPleromaScheduledStatusParams() {
    if (this is PleromaScheduledStatusParams) {
      return this as PleromaScheduledStatusParams;
    } else {
      return PleromaScheduledStatusParams(
        text: text,
        mediaIds: mediaIds,
        sensitive: sensitive,
        spoilerText: spoilerText,
        visibility: visibility,
        scheduledAt: scheduledAt,
        poll: poll,
        idempotency: idempotency,
        inReplyToId: inReplyToId,
        applicationId: applicationId,
        language: language,
        expiresInSeconds: expiresInSeconds,
        to: to,
        inReplyToConversationId: inReplyToConversationId,
      );
    }
  }
}

extension IScheduledStatusExtension on IScheduledStatus {
  IPostStatusData get postStatusData => PostStatusData(
        subject: params.spoilerText,
        text: params.text,
        scheduledAt: scheduledAt,
        visibility: params.visibility,
        mediaAttachments: mediaAttachments,
        poll: params.poll?.toPostStatusPoll(),
        to: params.to,
        inReplyToPleromaStatus:
            params.inReplyToPleromaStatus?.toPleromaStatus(),
        inReplyToConversationId: params.inReplyToConversationId,
        isNsfwSensitiveEnabled: params.sensitive,
        language: params.language,
        expiresInSeconds: params.expiresInSeconds,
      );
}

class DbScheduledStatusWrapper implements IScheduledStatus {
  final DbScheduledStatus dbScheduledStatus;

  DbScheduledStatusWrapper({
    required this.dbScheduledStatus,
  });

  @override
  IScheduledStatus copyWith({
    int? localId,
    String? remoteId,
    DateTime? scheduledAt,
    IPleromaScheduledStatusParams? params,
    bool? canceled,
    List<PleromaMediaAttachment>? mediaAttachments,
  }) =>
      DbScheduledStatusWrapper(
        dbScheduledStatus: dbScheduledStatus.copyWith(
          id: localId,
          remoteId: remoteId,
          scheduledAt: scheduledAt,
          params: params as PleromaScheduledStatusParams?,
          canceled: canceled,
          mediaAttachments: mediaAttachments,
        ),
      );

  @override
  int? get localId => dbScheduledStatus.id;

  @override
  List<PleromaMediaAttachment>? get mediaAttachments =>
      dbScheduledStatus.mediaAttachments;

  @override
  IPleromaScheduledStatusParams get params => dbScheduledStatus.params;

  @override
  String? get remoteId => dbScheduledStatus.remoteId;

  @override
  DateTime get scheduledAt => dbScheduledStatus.scheduledAt;

  @override
  bool get canceled => dbScheduledStatus.canceled == true;
}

class ScheduledStatusAdapterToStatus extends PostStatusDataStatusStatusAdapter {
  final IScheduledStatus scheduledStatus;

  ScheduledStatusAdapterToStatus({
    required IAccount account,
    required this.scheduledStatus,
  }) : super(
          localId: scheduledStatus.localId,
          account: account,
          postStatusData: scheduledStatus.postStatusData.toPostStatusData(),
          createdAt: scheduledStatus.scheduledAt,
          pendingState: PendingState.notSentYet,
          oldPendingRemoteId: null,
          wasSentWithIdempotencyKey: null,
        );

  @override
  bool get hiddenLocallyOnDevice => false;
}

enum ScheduledStatusState {
  scheduled,
  canceled,
  alreadyPosted,
}
