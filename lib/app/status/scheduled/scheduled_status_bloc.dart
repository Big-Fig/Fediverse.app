import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusBloc implements IDisposable {
  static IScheduledStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IScheduledStatusBloc>(context, listen: listen);

  ScheduledStatusState? get state;

  Stream<ScheduledStatusState?> get stateStream;

  String? get remoteId;

  IScheduledStatus get scheduledStatus;

  Stream<IScheduledStatus> get scheduledStatusStream;

  DateTime get scheduledAt;

  Stream<DateTime> get scheduledAtStream;

  String? get spoilerText;

  Stream<String?> get spoilerTextStream;

  List<IPleromaApiMediaAttachment>? get mediaAttachments;

  Stream<List<IPleromaApiMediaAttachment>?> get mediaAttachmentsStream;

  Future reSchedule({
    required DateTime scheduledAt,
  });

  Future cancelSchedule();

  Future refreshFromNetwork();

  IPostStatusData calculatePostStatusData();

  Future postScheduledPost(PostStatusData postStatusData);
}
