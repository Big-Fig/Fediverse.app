import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusBloc implements IDisposable {

  static IScheduledStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IScheduledStatusBloc>(context, listen: listen);

  ScheduledStatusState get state;

  Stream<ScheduledStatusState> get stateStream;

  String get remoteId;

  IScheduledStatus get scheduledStatus;

  Stream<IScheduledStatus> get scheduledStatusStream;

  DateTime get scheduledAt;

  Stream<DateTime> get scheduledAtStream;

  String get spoilerText;

  Stream<String> get spoilerTextStream;

  List<IPleromaMediaAttachment> get mediaAttachments;

  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream;

  Future reSchedule({@required DateTime scheduledAt});

  Future cancelSchedule();

  Future refreshFromNetwork();

  IPostStatusData calculatePostStatusData();

  Future<bool> postScheduledPost(PostStatusData postStatusData);
}
