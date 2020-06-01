// To parse this JSON data, do
//
//     final userChat = userChatFromJson(jsonString);

import 'dart:convert';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Relationship.dart';
import 'package:fedi/Pleroma/Models/message.dart';

List<UserChat> chatsFromJson(String str) => List<UserChat>.from(json.decode(str).map((x) => UserChat.fromJson(x)));

UserChat userChatFromJson(String str) => UserChat.fromJson(json.decode(str));

String userChatToJson(UserChat data) => json.encode(data.toJson());

class UserChat {
    Account account;
    String id;
    Message lastMessage;
    int unread;
    DateTime updatedAt;

    UserChat({
        this.account,
        this.id,
        this.lastMessage,
        this.unread,
        this.updatedAt,
    });

    factory UserChat.fromJson(Map<String, dynamic> json) => UserChat(
        account: json["account"] == null ? null : Account.fromJson(json["account"]),
        id: json["id"] == null ? null : json["id"],
        lastMessage: json["last_message"] == null ? null : Message.fromJson(json["last_message"]),
        unread: json["unread"] == null ? null : json["unread"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "account": account == null ? null : account.toJson(),
        "id": id == null ? null : id,
        "last_message": lastMessage == null ? null : lastMessage.toJson(),
        "unread": unread == null ? null : unread,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}


class AccountPleroma {
    String apId;
    dynamic backgroundImage;
    bool confirmationPending;
    bool hideFavorites;
    bool hideFollowers;
    bool hideFollowersCount;
    bool hideFollows;
    bool hideFollowsCount;
    bool isAdmin;
    bool isModerator;
    Relationship relationship;
    bool skipThreadContainment;
    List<dynamic> tags;

    AccountPleroma({
        this.apId,
        this.backgroundImage,
        this.confirmationPending,
        this.hideFavorites,
        this.hideFollowers,
        this.hideFollowersCount,
        this.hideFollows,
        this.hideFollowsCount,
        this.isAdmin,
        this.isModerator,
        this.relationship,
        this.skipThreadContainment,
        this.tags,
    });

    factory AccountPleroma.fromJson(Map<String, dynamic> json) => AccountPleroma(
        apId: json["ap_id"] == null ? null : json["ap_id"],
        backgroundImage: json["background_image"],
        confirmationPending: json["confirmation_pending"] == null ? null : json["confirmation_pending"],
        hideFavorites: json["hide_favorites"] == null ? null : json["hide_favorites"],
        hideFollowers: json["hide_followers"] == null ? null : json["hide_followers"],
        hideFollowersCount: json["hide_followers_count"] == null ? null : json["hide_followers_count"],
        hideFollows: json["hide_follows"] == null ? null : json["hide_follows"],
        hideFollowsCount: json["hide_follows_count"] == null ? null : json["hide_follows_count"],
        isAdmin: json["is_admin"] == null ? null : json["is_admin"],
        isModerator: json["is_moderator"] == null ? null : json["is_moderator"],
        relationship: json["relationship"] == null ? null : Relationship.fromJson(json["relationship"]),
        skipThreadContainment: json["skip_thread_containment"] == null ? null : json["skip_thread_containment"],
        tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "ap_id": apId == null ? null : apId,
        "background_image": backgroundImage,
        "confirmation_pending": confirmationPending == null ? null : confirmationPending,
        "hide_favorites": hideFavorites == null ? null : hideFavorites,
        "hide_followers": hideFollowers == null ? null : hideFollowers,
        "hide_followers_count": hideFollowersCount == null ? null : hideFollowersCount,
        "hide_follows": hideFollows == null ? null : hideFollows,
        "hide_follows_count": hideFollowsCount == null ? null : hideFollowsCount,
        "is_admin": isAdmin == null ? null : isAdmin,
        "is_moderator": isModerator == null ? null : isModerator,
        "relationship": relationship == null ? null : relationship.toJson(),
        "skip_thread_containment": skipThreadContainment == null ? null : skipThreadContainment,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
    };
}

class Source {
    List<dynamic> fields;
    String note;
    SourcePleroma pleroma;
    bool sensitive;

    Source({
        this.fields,
        this.note,
        this.pleroma,
        this.sensitive,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        fields: json["fields"] == null ? null : List<dynamic>.from(json["fields"].map((x) => x)),
        note: json["note"] == null ? null : json["note"],
        pleroma: json["pleroma"] == null ? null : SourcePleroma.fromJson(json["pleroma"]),
        sensitive: json["sensitive"] == null ? null : json["sensitive"],
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : List<dynamic>.from(fields.map((x) => x)),
        "note": note == null ? null : note,
        "pleroma": pleroma == null ? null : pleroma.toJson(),
        "sensitive": sensitive == null ? null : sensitive,
    };
}

class SourcePleroma {
    String actorType;
    bool discoverable;

    SourcePleroma({
        this.actorType,
        this.discoverable,
    });

    factory SourcePleroma.fromJson(Map<String, dynamic> json) => SourcePleroma(
        actorType: json["actor_type"] == null ? null : json["actor_type"],
        discoverable: json["discoverable"] == null ? null : json["discoverable"],
    );

    Map<String, dynamic> toJson() => {
        "actor_type": actorType == null ? null : actorType,
        "discoverable": discoverable == null ? null : discoverable,
    };
}

class LastMessage {
    String accountId;
    dynamic attachment;
    String chatId;
    String content;
    DateTime createdAt;
    List<dynamic> emojis;
    String id;

    LastMessage({
        this.accountId,
        this.attachment,
        this.chatId,
        this.content,
        this.createdAt,
        this.emojis,
        this.id,
    });

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        accountId: json["account_id"] == null ? null : json["account_id"],
        attachment: json["attachment"],
        chatId: json["chat_id"] == null ? null : json["chat_id"],
        content: json["content"] == null ? null : json["content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        emojis: json["emojis"] == null ? null : List<dynamic>.from(json["emojis"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "account_id": accountId == null ? null : accountId,
        "attachment": attachment,
        "chat_id": chatId == null ? null : chatId,
        "content": content == null ? null : content,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "emojis": emojis == null ? null : List<dynamic>.from(emojis.map((x) => x)),
        "id": id == null ? null : id,
    };
}
