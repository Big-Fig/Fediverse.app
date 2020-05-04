import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusBloc implements Disposable {
  static IScheduledStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IScheduledStatusBloc>(context, listen: listen);

  IScheduledStatus get scheduledStatus;
  Stream<IScheduledStatus> get scheduledStatusStream;
  String get remoteId;

  List<IPleromaMediaAttachment> get mediaAttachments;

  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream;

  DateTime get scheduledAt;

  Stream<DateTime> get scheduledAtStream;

  String get text;

  Stream<String> get textStream;

  String get spoilerText;

  Stream<String> get spoilerTextStream;

  bool get sensitive;

  Stream<bool> get sensitiveStream;

  String get visibility;

  Stream<String> get visibilityStream;

  PleromaVisibility get pleromaVisibility;

  Stream<PleromaVisibility> get pleromaVisibilityStream;

  String get inReplyToId;

  Stream<String> get inReplyToIdStream;

  Future refreshFromNetwork();

  Future reSchedule({@required DateTime scheduledAt});

  Future cancelSchedule();
}
