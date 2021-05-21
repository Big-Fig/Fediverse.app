import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';

// ignore_for_file: no-magic-number

abstract class IInstanceAnnouncement {
  int? get localId;

  String get remoteId;

  String get text;

  bool get published;

  bool get allDay;

  DateTime get createdAt;

  DateTime get updatedAt;

  bool get read;

  List<IPleromaApiAnnouncementReaction> get reactions;

  DateTime? get scheduledAt;

  DateTime? get startsAt;

  DateTime? get endsAt;

  IInstanceAnnouncement copyWith({
    int? localId,
    String? remoteId,
    String? text,
    bool? published,
    bool? allDay,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? read,
    List<IPleromaApiAnnouncementReaction>? reactions,
    DateTime? scheduledAt,
    DateTime? startsAt,
    DateTime? endsAt,
  });
}

class DbInstanceAnnouncementPopulated {
  final DbInstanceAnnouncement dbInstanceAnnouncement;

  DbInstanceAnnouncementPopulated({
    required this.dbInstanceAnnouncement,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbInstanceAnnouncementPopulated &&
          runtimeType == other.runtimeType &&
          dbInstanceAnnouncement == other.dbInstanceAnnouncement;

  @override
  int get hashCode => dbInstanceAnnouncement.hashCode;

  @override
  String toString() => 'DbInstanceAnnouncementPopulated{'
      'dbInstanceAnnouncement: $dbInstanceAnnouncement'
      '}';
}

class DbInstanceAnnouncementPopulatedWrapper implements IInstanceAnnouncement {
  final DbInstanceAnnouncementPopulated dbInstanceAnnouncementPopulated;

  DbInstanceAnnouncementPopulatedWrapper({
    required this.dbInstanceAnnouncementPopulated,
  });

  DbInstanceAnnouncement get dbInstanceAnnouncement =>
      dbInstanceAnnouncementPopulated.dbInstanceAnnouncement;

  @override
  bool get allDay => dbInstanceAnnouncement.allDay;

  @override
  DateTime get createdAt => dbInstanceAnnouncement.createdAt;

  @override
  DateTime? get endsAt => dbInstanceAnnouncement.endsAt;

  @override
  int? get localId => dbInstanceAnnouncement.id;

  @override
  bool get published => dbInstanceAnnouncement.published;

  @override
  List<IPleromaApiAnnouncementReaction> get reactions =>
      dbInstanceAnnouncement.reactions;

  @override
  bool get read => dbInstanceAnnouncement.read;

  @override
  String get remoteId => dbInstanceAnnouncement.remoteId;

  @override
  DateTime? get scheduledAt => dbInstanceAnnouncement.scheduledAt;

  @override
  DateTime? get startsAt => dbInstanceAnnouncement.startsAt;

  @override
  String get text => dbInstanceAnnouncement.content;

  @override
  DateTime get updatedAt => dbInstanceAnnouncement.updatedAt;

  @override
  // ignore: long-parameter-list
  IInstanceAnnouncement copyWith({
    int? localId,
    String? remoteId,
    String? text,
    bool? published,
    bool? allDay,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? read,
    List<IPleromaApiAnnouncementReaction>? reactions,
    DateTime? scheduledAt,
    DateTime? startsAt,
    DateTime? endsAt,
  }) =>
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: dbInstanceAnnouncement.copyWith(
            id: localId,
            remoteId: remoteId,
            content: text,
            published: published,
            allDay: allDay,
            createdAt: createdAt,
            updatedAt: updatedAt,
            read: read,
            reactions: reactions?.toPleromaApiAnnouncementReactionList(),
            scheduledAt: scheduledAt,
            startsAt: startsAt,
            endsAt: endsAt,
          ),
        ),
      );
}

extension IInstanceAnnouncementExtension on IInstanceAnnouncement {
  DbInstanceAnnouncementPopulatedWrapper
      toDbInstanceAnnouncementPopulatedWrapper() {
    if (this is DbInstanceAnnouncementPopulatedWrapper) {
      return this as DbInstanceAnnouncementPopulatedWrapper;
    } else {
      return DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: toDbInstanceAnnouncementPopulated(),
      );
    }
  }

  DbInstanceAnnouncementPopulated toDbInstanceAnnouncementPopulated() {
    if (this is DbInstanceAnnouncementPopulatedWrapper) {
      var dbInstanceAnnouncementPopulatedWrapper =
          this as DbInstanceAnnouncementPopulatedWrapper;

      return dbInstanceAnnouncementPopulatedWrapper
          .dbInstanceAnnouncementPopulated;
    } else {
      return DbInstanceAnnouncementPopulated(
        dbInstanceAnnouncement: toDbInstanceAnnouncement(),
      );
    }
  }

  DbInstanceAnnouncement toDbInstanceAnnouncement() {
    if (this is DbInstanceAnnouncementPopulatedWrapper) {
      var dbInstanceAnnouncementPopulatedWrapper =
          this as DbInstanceAnnouncementPopulatedWrapper;

      return dbInstanceAnnouncementPopulatedWrapper
          .dbInstanceAnnouncementPopulated.dbInstanceAnnouncement;
    } else {
      return DbInstanceAnnouncement(
        remoteId: remoteId,
        allDay: allDay,
        published: published,
        createdAt: createdAt,
        updatedAt: updatedAt,
        read: read,
        content: text,
        reactions: reactions.toPleromaApiAnnouncementReactionList(),
      );
    }
  }
}
