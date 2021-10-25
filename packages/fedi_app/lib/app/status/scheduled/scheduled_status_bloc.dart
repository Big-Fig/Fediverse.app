import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

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

  List<IUnifediApiMediaAttachment>? get mediaAttachments;

  Stream<List<IUnifediApiMediaAttachment>?> get mediaAttachmentsStream;

  Future<void> reSchedule({
    required DateTime scheduledAt,
  });

  Future<void> cancelSchedule();

  Future<void> refreshFromNetwork();

  IPostStatusData calculatePostStatusData();

  Future<void> postScheduledPost(PostStatusData postStatusData);
}
