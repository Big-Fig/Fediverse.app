// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaAnnouncement _$PleromaAnnouncementFromJson(Map<String, dynamic> json) {
  return PleromaAnnouncement(
    id: json['id'] as String?,
    text: json['text'] as String?,
    published: json['published'] as bool?,
    allDay: json['all_day'] as bool?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    read: json['read'] as bool?,
    reactions: (json['reactions'] as List<dynamic>?)
        ?.map((e) =>
            PleromaAnnouncementReaction.fromJson(e as Map<String, dynamic>))
        .toList(),
    scheduledAt: json['scheduled_at'] == null
        ? null
        : DateTime.parse(json['scheduled_at'] as String),
    startsAt: json['starts_at'] == null
        ? null
        : DateTime.parse(json['starts_at'] as String),
    endsAt: json['ends_at'] == null
        ? null
        : DateTime.parse(json['ends_at'] as String),
  );
}

Map<String, dynamic> _$PleromaAnnouncementToJson(
        PleromaAnnouncement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'published': instance.published,
      'all_day': instance.allDay,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'read': instance.read,
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
      'scheduled_at': instance.scheduledAt?.toIso8601String(),
      'starts_at': instance.startsAt?.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
    };

PleromaAnnouncementReaction _$PleromaAnnouncementReactionFromJson(
    Map<String, dynamic> json) {
  return PleromaAnnouncementReaction(
    name: json['name'] as String?,
    count: json['count'] as int?,
    me: json['me'] as bool?,
    url: json['url'] as String?,
    staticUrl: json['static_url'] as String?,
  );
}

Map<String, dynamic> _$PleromaAnnouncementReactionToJson(
        PleromaAnnouncementReaction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'me': instance.me,
      'url': instance.url,
      'static_url': instance.staticUrl,
    };
