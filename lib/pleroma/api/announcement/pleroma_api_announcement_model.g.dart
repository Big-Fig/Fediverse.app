// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiAnnouncement _$PleromaApiAnnouncementFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAnnouncement(
    id: json['id'] as String,
    content: json['content'] as String,
    allDay: json['all_day'] as bool,
    publishedAt: DateTime.parse(json['published_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    read: json['read'] as bool?,
    reactions: (json['reactions'] as List<dynamic>?)
        ?.map((e) =>
            PleromaApiAnnouncementReaction.fromJson(e as Map<String, dynamic>))
        .toList(),
    mentions: (json['mentions'] as List<dynamic>?)
        ?.map((e) => PleromaApiMention.fromJson(e as Map<String, dynamic>))
        .toList(),
    statuses: (json['statuses'] as List<dynamic>?)
        ?.map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => PleromaApiTag.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$PleromaApiAnnouncementToJson(
        PleromaApiAnnouncement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'all_day': instance.allDay,
      'published_at': instance.publishedAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'read': instance.read,
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
      'mentions': instance.mentions?.map((e) => e.toJson()).toList(),
      'statuses': instance.statuses?.map((e) => e.toJson()).toList(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'scheduled_at': instance.scheduledAt?.toIso8601String(),
      'starts_at': instance.startsAt?.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
    };

PleromaApiAnnouncementReaction _$PleromaApiAnnouncementReactionFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAnnouncementReaction(
    name: json['name'] as String,
    count: json['count'] as int,
    me: json['me'] as bool,
    url: json['url'] as String?,
    staticUrl: json['static_url'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiAnnouncementReactionToJson(
        PleromaApiAnnouncementReaction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'me': instance.me,
      'url': instance.url,
      'static_url': instance.staticUrl,
    };
