import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fedi/mastodon/relationship/mastodon_relationship_model.dart';

part 'pleroma_relationship_model.g.dart';

abstract class IPleromaRelationship implements IMastodonRelationship {

}

@HiveType()
@JsonSerializable()
class PleromaRelationship implements IPleromaRelationship {
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

  PleromaRelationship({
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

  factory PleromaRelationship.fromJson(Map<String, dynamic> json) =>
      _$PleromaRelationshipFromJson(json);

  factory PleromaRelationship.fromJsonString(String jsonString) =>
      _$PleromaRelationshipFromJson(jsonDecode(jsonString));

  static List<PleromaRelationship> listFromJsonString(String str) =>
      new List<PleromaRelationship>.from(
          json.decode(str).map((x) => PleromaRelationship.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaRelationshipToJson(this);

  String toJsonString() => jsonEncode(_$PleromaRelationshipToJson(this));
}
