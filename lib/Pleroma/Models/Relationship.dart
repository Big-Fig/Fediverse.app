// To parse this JSON data, do
//
//     final relationship = relationshipFromJson(jsonString);

import 'dart:convert';

List<Relationship> relationshipFromJson(String str) => List<Relationship>.from(json.decode(str).map((x) => Relationship.fromJson(x)));

String relationshipToJson(List<Relationship> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Relationship {
    bool blocking;
    bool domainBlocking;
    bool endorsed;
    bool followedBy;
    bool following;
    String id;
    bool muting;
    bool mutingNotifications;
    bool requested;
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

    factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        blocking: json["blocking"],
        domainBlocking: json["domain_blocking"],
        endorsed: json["endorsed"],
        followedBy: json["followed_by"],
        following: json["following"],
        id: json["id"],
        muting: json["muting"],
        mutingNotifications: json["muting_notifications"],
        requested: json["requested"],
        showingReblogs: json["showing_reblogs"],
        subscribing: json["subscribing"],
    );

    Map<String, dynamic> toJson() => {
        "blocking": blocking,
        "domain_blocking": domainBlocking,
        "endorsed": endorsed,
        "followed_by": followedBy,
        "following": following,
        "id": id,
        "muting": muting,
        "muting_notifications": mutingNotifications,
        "requested": requested,
        "showing_reblogs": showingReblogs,
        "subscribing": subscribing,
    };
}
