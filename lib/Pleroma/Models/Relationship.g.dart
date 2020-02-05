// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
    blocking: json['blocking'] as bool,
    domainBlocking: json['domain_blocking'] as bool,
    endorsed: json['endorsed'] as bool,
    followedBy: json['followed_by'] as bool,
    following: json['following'] as bool,
    id: json['id'] as String,
    muting: json['muting'] as bool,
    mutingNotifications: json['muting_notifications'] as bool,
    requested: json['requested'] as bool,
    showingReblogs: json['showing_reblogs'] as bool,
    subscribing: json['subscribing'] as bool,
  );
}

Map<String, dynamic> _$RelationshipToJson(Relationship instance) =>
    <String, dynamic>{
      'blocking': instance.blocking,
      'domain_blocking': instance.domainBlocking,
      'endorsed': instance.endorsed,
      'followed_by': instance.followedBy,
      'following': instance.following,
      'id': instance.id,
      'muting': instance.muting,
      'muting_notifications': instance.mutingNotifications,
      'requested': instance.requested,
      'showing_reblogs': instance.showingReblogs,
      'subscribing': instance.subscribing,
    };
