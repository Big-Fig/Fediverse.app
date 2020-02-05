// To parse this JSON data, do
//
//     final relationship = relationshipFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'Relationship.g.dart';

@JsonSerializable()
class Relationship {
    bool blocking;
    @JsonKey(name: "domain_blocking")
    bool domainBlocking;
    bool endorsed;
    @JsonKey(name: "followed_by")
    bool followedBy;
    bool following;
    String id;
    bool muting;
    @JsonKey(name: "muting_notifications")
    bool mutingNotifications;
    bool requested;
    @JsonKey(name: "showing_reblogs")
    bool showingReblogs;
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
        new List<Relationship>.from(json.decode(str).map((x) => Relationship.fromJson(x)));


    Map<String, dynamic> toJson() => _$RelationshipToJson(this);
    String toJsonString() => jsonEncode(_$RelationshipToJson(this));
}
