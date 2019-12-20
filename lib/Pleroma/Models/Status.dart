// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';
import 'package:fedi/Pleroma/Models/Relationship.dart';

import './Account.dart';

List<Status> statusFromJson(String str) => new List<Status>.from(json.decode(str).map((x) => Status.fromJson(x)));

String statusToJson(List<Status> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Status {
    String id;
    DateTime createdAt;
    String inReplyToId;
    String inReplyToAccountId;
    bool sensitive;
    String spoilerText;
    Visibility visibility;
    String uri;
    String url;
    int repliesCount;
    int reblogsCount;
    int favouritesCount;
    bool favourited;
    bool reblogged;
    bool muted;
    bool bookmarked;
    String content;
    Status reblog;
    Application application;
    Account account;
    List<MediaAttachment> mediaAttachments;
    List<Mention> mentions;
    List<Tag> tags;
    List<dynamic> emojis;
    dynamic poll;

    Status({
        this.id,
        this.createdAt,
        this.inReplyToId,
        this.inReplyToAccountId,
        this.sensitive,
        this.spoilerText,
        this.visibility,
        this.uri,
        this.url,
        this.repliesCount,
        this.reblogsCount,
        this.favouritesCount,
        this.favourited,
        this.reblogged,
        this.muted,
        this.bookmarked,
        this.content,
        this.reblog,
        this.application,
        this.account,
        this.mediaAttachments,
        this.mentions,
        this.tags,
        this.emojis,
        this.poll,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        inReplyToId: json["in_reply_to_id"] == null ? null : json["in_reply_to_id"],
        inReplyToAccountId: json["in_reply_to_account_id"] == null ? null : json["in_reply_to_account_id"],
        sensitive: json["sensitive"],
        spoilerText: json["spoiler_text"],
        visibility: visibilityValues.map[json["visibility"]],
        uri: json["uri"],
        url: json["url"],
        repliesCount: json["replies_count"],
        reblogsCount: json["reblogs_count"],
        favouritesCount: json["favourites_count"],
        favourited: json["favourited"],
        reblogged: json["reblogged"],
        muted: json["muted"],
        bookmarked: json["bookmarked"],
        content: json["content"],
        reblog: json["reblog"] == null ? null : Status.fromJson(json["reblog"]),
        application: json["application"] == null ? null : Application.fromJson(json["application"]),
        account: Account.fromJson(json["account"]),
        mediaAttachments: List<MediaAttachment>.from(json["media_attachments"].map((x) => MediaAttachment.fromJson(x))),
        mentions: List<Mention>.from(json["mentions"].map((x) => Mention.fromJson(x))),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        emojis: List<dynamic>.from(json["emojis"].map((x) => x)),
        poll: json["poll"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "in_reply_to_id": inReplyToId == null ? null : inReplyToId,
        "in_reply_to_account_id": inReplyToAccountId == null ? null : inReplyToAccountId,
        "sensitive": sensitive,
        "spoiler_text": spoilerText,
        "visibility": visibilityValues.reverse[visibility],
        "uri": uri,
        "url": url,
        "replies_count": repliesCount,
        "reblogs_count": reblogsCount,
        "favourites_count": favouritesCount,
        "favourited": favourited,
        "reblogged": reblogged,
        "muted": muted,
        "bookmarked": bookmarked,
        "content": content,
        "reblog": reblog == null ? null : reblog.toJson(),
        "application": application == null ? null : application.toJson(),
        "account": account.toJson(),
        "media_attachments": List<dynamic>.from(mediaAttachments.map((x) => x.toJson())),
        "mentions": List<dynamic>.from(mentions.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "emojis": List<dynamic>.from(emojis.map((x) => x)),
        "poll": poll,
    };
}


class Field {
    String name;
    String value;

    Field({
        this.name,
        this.value,
    });

    factory Field.fromJson(Map<String, dynamic> json) => new Field(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}

class AccountPleroma {
    dynamic backgroundImage;
    bool confirmationPending;
    bool hideFavorites;
    bool hideFollowers;
    bool hideFollows;
    bool isAdmin;
    bool isModerator;
    Relationship relationship;
    bool skipThreadContainment;
    List<dynamic> tags;

    AccountPleroma({
        this.backgroundImage,
        this.confirmationPending,
        this.hideFavorites,
        this.hideFollowers,
        this.hideFollows,
        this.isAdmin,
        this.isModerator,
        this.relationship,
        this.skipThreadContainment,
        this.tags,
    });

    factory AccountPleroma.fromJson(Map<String, dynamic> json) => new AccountPleroma(
        backgroundImage: json["background_image"],
        confirmationPending: json["confirmation_pending"],
        hideFavorites: json["hide_favorites"],
        hideFollowers: json["hide_followers"],
        hideFollows: json["hide_follows"],
        isAdmin: json["is_admin"],
        isModerator: json["is_moderator"],
        relationship: Relationship.fromJson(json["relationship"]),
        skipThreadContainment: json["skip_thread_containment"],
        tags: new List<dynamic>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "background_image": backgroundImage,
        "confirmation_pending": confirmationPending,
        "hide_favorites": hideFavorites,
        "hide_followers": hideFollowers,
        "hide_follows": hideFollows,
        "is_admin": isAdmin,
        "is_moderator": isModerator,
        "relationship": relationship.toJson(),
        "skip_thread_containment": skipThreadContainment,
        "tags": new List<dynamic>.from(tags.map((x) => x)),
    };
}


class Source {
    String note;
    Relationship pleroma;
    bool sensitive;

    Source({
        this.note,
        this.pleroma,
        this.sensitive,
    });

    factory Source.fromJson(Map<String, dynamic> json) => new Source(
        note: json["note"],
        pleroma: Relationship.fromJson(json["pleroma"]),
        sensitive: json["sensitive"],
    );

    Map<String, dynamic> toJson() => {
        "note": note,
        "pleroma": pleroma.toJson(),
        "sensitive": sensitive,
    };
}

class Application {
    Name name;
    dynamic website;

    Application({
        this.name,
        this.website,
    });

    factory Application.fromJson(Map<String, dynamic> json) => new Application(
        name: nameValues.map[json["name"]],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "website": website,
    };
}

enum Name { WEB }

final nameValues = new EnumValues({
    "Web": Name.WEB
});

class MediaAttachment {
    String description;
    String id;
    MediaAttachmentPleroma pleroma;
    String previewUrl;
    String remoteUrl;
    String textUrl;
    String type;
    String url;

    MediaAttachment({
        this.description,
        this.id,
        this.pleroma,
        this.previewUrl,
        this.remoteUrl,
        this.textUrl,
        this.type,
        this.url,
    });

    factory MediaAttachment.fromJson(Map<String, dynamic> json) => new MediaAttachment(
        description: json["description"],
        id: json["id"],
        pleroma: json["pleroma"] == null ? null : MediaAttachmentPleroma.fromJson(json["pleroma"]),
        previewUrl: json["preview_url"],
        remoteUrl: json["remote_url"],
        textUrl: json["text_url"],
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "pleroma": pleroma.toJson(),
        "preview_url": previewUrl,
        "remote_url": remoteUrl,
        "text_url": textUrl,
        "type": type,
        "url": url,
    };
}

class MediaAttachmentPleroma {
    String mimeType;

    MediaAttachmentPleroma({
        this.mimeType,
    });

    factory MediaAttachmentPleroma.fromJson(Map<String, dynamic> json) => new MediaAttachmentPleroma(
        mimeType: json["mime_type"],
    );

    Map<String, dynamic> toJson() => {
        "mime_type": mimeType,
    };
}

class Mention {
    String acct;
    String id;
    String url;
    String username;

    Mention({
        this.acct,
        this.id,
        this.url,
        this.username,
    });

    factory Mention.fromJson(Map<String, dynamic> json) => new Mention(
        acct: json["acct"],
        id: json["id"],
        url: json["url"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "acct": acct,
        "id": id,
        "url": url,
        "username": username,
    };
}

class StatusPleroma {
    Content content;
    int conversationId;
    String inReplyToAccountAcct;
    bool local;
    Content spoilerText;

    StatusPleroma({
        this.content,
        this.conversationId,
        this.inReplyToAccountAcct,
        this.local,
        this.spoilerText,
    });

    factory StatusPleroma.fromJson(Map<String, dynamic> json) => new StatusPleroma(
        content: json["content"] == null ? null : Content.fromJson(json["content"]),
        conversationId: json["conversation_id"] == null ? null : json["conversation_id"],
        inReplyToAccountAcct: json["in_reply_to_account_acct"] == null ? null : json["in_reply_to_account_acct"],
        local: json["local"],
        spoilerText: json["spoiler_text"] == null ? null : Content.fromJson(json["spoiler_text"]),
    );

    Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
        "conversation_id": conversationId == null ? null : conversationId,
        "in_reply_to_account_acct": inReplyToAccountAcct == null ? null : inReplyToAccountAcct,
        "local": local,
        "spoiler_text": spoilerText == null ? null : spoilerText.toJson(),
    };
}

class Content {
    String textPlain;

    Content({
        this.textPlain,
    });

    factory Content.fromJson(Map<String, dynamic> json) => new Content(
        textPlain: json["text/plain"],
    );

    Map<String, dynamic> toJson() => {
        "text/plain": textPlain,
    };
}

class Tag {
    String name;
    String url;

    Tag({
        this.name,
        this.url,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => new Tag(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

enum Visibility { PUBLIC, UNLISTED, DIRECT }

final visibilityValues = new EnumValues({
    "public": Visibility.PUBLIC,
    "unlisted": Visibility.UNLISTED,
    "direct": Visibility.DIRECT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
