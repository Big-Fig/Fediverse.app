import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/post/post_status_data_status_status_adapter.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IScheduledStatus {
  int? get localId;

  String? get remoteId;

  DateTime get scheduledAt;

  IPleromaApiScheduledStatusParams get params;

  List<PleromaApiMediaAttachment>? get mediaAttachments;

  bool get canceled;

  IScheduledStatus copyWith({
    int? localId,
    String? remoteId,
    DateTime? scheduledAt,
    IPleromaApiScheduledStatusParams? params,
    bool? canceled,
    List<PleromaApiMediaAttachment>? mediaAttachments,
  });
}

extension DbScheduledStatusPopulatedExtension on DbScheduledStatusPopulated {
  DbScheduledStatusPopulatedWrapper toDbScheduledStatusPopulatedWrapper() {
    return DbScheduledStatusPopulatedWrapper(dbScheduledStatusPopulated: this);
  }
}

extension DbScheduledStatusPopulatedListExtension on List<
    DbScheduledStatusPopulated> {
  List<
      DbScheduledStatusPopulatedWrapper> toDbScheduledStatusPopulatedWrappers() {
    return map((item) => item.toDbScheduledStatusPopulatedWrapper()).toList();
  }
}

class DbScheduledStatusPopulated {
  final DbScheduledStatus dbScheduledStatus;

  DbScheduledStatusPopulated({
    required this.dbScheduledStatus,
  });

  @override
  String toString() {
    return 'DbScheduledStatusPopulated{'
        'dbScheduledStatus: $dbScheduledStatus'
        '}';
  }

  DbScheduledStatusPopulated copyWith({
    DbScheduledStatus? dbScheduledStatus,
  }) =>
      DbScheduledStatusPopulated(
        dbScheduledStatus: dbScheduledStatus ?? this.dbScheduledStatus,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DbScheduledStatusPopulated &&
              runtimeType == other.runtimeType &&
              dbScheduledStatus == other.dbScheduledStatus;

  @override
  int get hashCode => dbScheduledStatus.hashCode;
}

extension IPleromaScheduledStatusParamsExtension
on IPleromaApiScheduledStatusParams {
  PleromaApiScheduledStatusParams toPleromaScheduledStatusParams() {
    if (this is PleromaApiScheduledStatusParams) {
      return this as PleromaApiScheduledStatusParams;
    } else {
      return PleromaApiScheduledStatusParams(
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
  IPostStatusData get postStatusData =>
      PostStatusData(
        subject: params.spoilerText,
        text: params.text,
        scheduledAt: scheduledAt,
        visibilityString: params.visibility,
        mediaAttachments: mediaAttachments,
        poll: params.poll?.toPostStatusPoll(),
        to: params.to,
        inReplyToPleromaStatus:
        params.inReplyToPleromaApiStatus?.toPleromaApiStatus(),
        inReplyToConversationId: params.inReplyToConversationId,
        isNsfwSensitiveEnabled: params.sensitive,
        language: params.language,
        expiresInSeconds: params.expiresInSeconds,
      );

  DbScheduledStatusPopulatedWrapper toDbScheduledStatusPopulatedWrapper() {
    if (this is DbScheduledStatusPopulatedWrapper) {
      var dbScheduledStatusPopulatedWrapper = this as DbScheduledStatusPopulatedWrapper;
      return dbScheduledStatusPopulatedWrapper;
    } else {
      return DbScheduledStatusPopulatedWrapper(
        dbScheduledStatusPopulated: toDbScheduledStatusPopulated(),
      );
    }
  }

  DbScheduledStatusPopulated toDbScheduledStatusPopulated() {
    if (this is DbScheduledStatusPopulatedWrapper) {
      var dbScheduledStatusPopulatedWrapper = this as DbScheduledStatusPopulatedWrapper;
      return dbScheduledStatusPopulatedWrapper.dbScheduledStatusPopulated;
    } else {
      return DbScheduledStatusPopulated(
          dbScheduledStatus: toDbScheduledStatus(),
      );
    }
  }

  DbScheduledStatus toDbScheduledStatus() {
    if (this is DbScheduledStatusPopulatedWrapper) {
      var dbScheduledStatusPopulatedWrapper = this as DbScheduledStatusPopulatedWrapper;
      return dbScheduledStatusPopulatedWrapper.dbScheduledStatusPopulated
          .dbScheduledStatus;
    } else {
      return DbScheduledStatus(
        remoteId: remoteId!,
        scheduledAt: scheduledAt,
        canceled: canceled,
        params: params.toPleromaScheduledStatusParams(),
      );
    }
  }
}

class DbScheduledStatusPopulatedWrapper implements IScheduledStatus {
  final DbScheduledStatusPopulated dbScheduledStatusPopulated;

  DbScheduledStatusPopulatedWrapper({
    required this.dbScheduledStatusPopulated,
  });

  DbScheduledStatus get dbScheduledStatus =>
      dbScheduledStatusPopulated.dbScheduledStatus;

  @override
  IScheduledStatus copyWith({
    int? localId,
    String? remoteId,
    DateTime? scheduledAt,
    IPleromaApiScheduledStatusParams? params,
    bool? canceled,
    List<PleromaApiMediaAttachment>? mediaAttachments,
  }) =>
      DbScheduledStatusPopulatedWrapper(
        dbScheduledStatusPopulated: DbScheduledStatusPopulated(
          dbScheduledStatus:
          dbScheduledStatusPopulated.dbScheduledStatus.copyWith(
            id: localId,
            remoteId: remoteId,
            scheduledAt: scheduledAt,
            params: params?.toPleromaScheduledStatusParams(),
            canceled: canceled,
            mediaAttachments: mediaAttachments,
          ),
        ),
      );

  @override
  int? get localId => dbScheduledStatus.id;

  @override
  List<PleromaApiMediaAttachment>? get mediaAttachments =>
      dbScheduledStatus.mediaAttachments;

  @override
  IPleromaApiScheduledStatusParams get params => dbScheduledStatus.params;

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
