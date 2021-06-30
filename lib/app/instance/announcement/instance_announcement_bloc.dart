import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementBloc implements IDisposable {
  static IInstanceAnnouncementBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementBloc>(context, listen: listen);

  IInstanceAnnouncement get instanceAnnouncement;

  Stream<IInstanceAnnouncement> get instanceAnnouncementStream;

  int? get localId;

  String get remoteId;

  String get content;

  List<IPleromaApiStatus>? get statuses;

  List<IPleromaApiMention>? get mentions;

  List<IPleromaApiTag>? get tags;

  bool get allDay;

  DateTime get publishedAt;

  DateTime get updatedAt;

  Stream<DateTime> get updatedAtStream;

  bool get read;

  Stream<bool> get readStream;

  List<IPleromaApiAnnouncementReaction>? get reactions;

  Stream<List<IPleromaApiAnnouncementReaction>?> get reactionsStream;

  DateTime? get scheduledAt;

  DateTime? get startsAt;

  DateTime? get endsAt;

  Future toggleEmojiReaction({
    required String emojiName,
  });

  Future addEmojiReaction({
    required String emojiName,
  });

  Future removeEmojiReaction({
    required String emojiName,
  });

  Future dismiss();
}
