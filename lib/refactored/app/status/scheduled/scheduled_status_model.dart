import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';


abstract class IScheduledStatus {
  int get localId;

  String get remoteId;

  DateTime get scheduledAt;

  IPleromaScheduledStatusParams get params;

  List<PleromaMediaAttachment> get mediaAttachments;

  IScheduledStatus copyWith(
      {int localId,
      String remoteId,
      DateTime scheduledAt,
      IPleromaScheduledStatusParams params,
      List<PleromaMediaAttachment> mediaAttachments});
}

class DbScheduledStatusWrapper implements IScheduledStatus {
  final DbScheduledStatus dbScheduledStatus;

  DbScheduledStatusWrapper(this.dbScheduledStatus);

  @override
  IScheduledStatus copyWith(
      {int localId,
      String remoteId,
      DateTime scheduledAt,
      IPleromaScheduledStatusParams params,
      List<PleromaMediaAttachment> mediaAttachments}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  int get localId => dbScheduledStatus.id;

  @override
  List<PleromaMediaAttachment> get mediaAttachments =>
      dbScheduledStatus.mediaAttachments;

  @override
  IPleromaScheduledStatusParams get params => dbScheduledStatus.params;

  @override
  String get remoteId => dbScheduledStatus.remoteId;

  @override
  DateTime get scheduledAt => dbScheduledStatus.scheduledAt;
}
