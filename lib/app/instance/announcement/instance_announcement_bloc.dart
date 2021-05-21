import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
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

  String get text;

  bool get published;

  Stream<bool> get publishedStream;

  bool get dismissed;

  Stream<bool> get dismissedStream;

  bool get allDay;

  DateTime get createdAt;

  DateTime get updatedAt;

  bool get read;

  Stream<bool> get readStream;

  List<IPleromaApiAnnouncementReaction> get reactions;

  Stream<List<IPleromaApiAnnouncementReaction>> get reactionsStream;

  DateTime? get scheduledAt;

  DateTime? get startsAt;

  DateTime? get endsAt;

  Future addEmojiReaction({
    required String emojiName,
  });

  Future removeEmojiReaction({
    required String emojiName,
  });

  Future dismiss();
}
