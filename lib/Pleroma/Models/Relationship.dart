// To parse this JSON data, do
//
//     final relationship = relationshipFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Relationship.g.dart';

@HiveType()
@JsonSerializable()
class Relationship {
  @HiveField(1)
  bool blocking;
  @JsonKey(name: "domain_blocking")
  @HiveField(2)
  bool domainBlocking;
  @HiveField(3)
  bool endorsed;
  @HiveField(4)
  @JsonKey(name: "followed_by")
  bool followedBy;
  @HiveField(5)
  bool following;
  @HiveField(6)
  String id;
  @HiveField(7)
  bool muting;
  @HiveField(8)
  @JsonKey(name: "muting_notifications")
  @HiveField(9)
  bool mutingNotifications;
  @HiveField(10)
  bool requested;
  @JsonKey(name: "showing_reblogs")
  @HiveField(11)
  bool showingReblogs;
  @HiveField(12)
  bool subscribing;

  Relationship({
    this.blocking,
    this.domainBlocking,
    this.endorsed,
    this.followedBy,
    this.following,
    this.id,
    this.muting,
    this.mutingNotifications,
    this.requested,
    this.showingReblogs,
    this.subscribing,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);

  factory Relationship.fromJsonString(String jsonString) =>
      _$RelationshipFromJson(jsonDecode(jsonString));

  static List<Relationship> listFromJsonString(String str) =>
      new List<Relationship>.from(
          json.decode(str).map((x) => Relationship.fromJson(x)));

  Map<String, dynamic> toJson() => _$RelationshipToJson(this);

  String toJsonString() => jsonEncode(_$RelationshipToJson(this));
}
