// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';
import 'package:fedi/Pleroma/Models/Emoji.dart';

List<Message> messageFromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageToJson(List<Message> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
    String accountId;
    Attachment attachment;
    String chatId;
    String content;
    DateTime createdAt;
    List<Emoji> emojis;
    String id;

    Message({
        this.accountId,
        this.attachment,
        this.chatId,
        this.content,
        this.createdAt,
        this.emojis,
        this.id,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        accountId: json["account_id"] == null ? null : json["account_id"],
        attachment: json["attachment"] == null ? null : Attachment.fromJson(json["attachment"]),
        chatId: json["chat_id"] == null ? null : json["chat_id"],
        content: json["content"] == null ? null : json["content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        emojis: json["emojis"] == null ? null : List<Emoji>.from(json["emojis"].map((x) => Emoji.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "account_id": accountId == null ? null : accountId,
        "attachment": attachment == null ? null : attachment.toJson(),
        "chat_id": chatId == null ? null : chatId,
        "content": content == null ? null : content,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "emojis": emojis == null ? null : List<dynamic>.from(emojis.map((x) => x.toJson())),
        "id": id == null ? null : id,
    };
}

class Attachment {
    String description;
    String id;
    Pleroma pleroma;
    String previewUrl;
    String remoteUrl;
    String textUrl;
    String type;
    String url;

    Attachment({
        this.description,
        this.id,
        this.pleroma,
        this.previewUrl,
        this.remoteUrl,
        this.textUrl,
        this.type,
        this.url,
    });

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        description: json["description"] == null ? null : json["description"],
        id: json["id"] == null ? null : json["id"],
        pleroma: json["pleroma"] == null ? null : Pleroma.fromJson(json["pleroma"]),
        previewUrl: json["preview_url"] == null ? null : json["preview_url"],
        remoteUrl: json["remote_url"] == null ? null : json["remote_url"],
        textUrl: json["text_url"] == null ? null : json["text_url"],
        type: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "id": id == null ? null : id,
        "pleroma": pleroma == null ? null : pleroma.toJson(),
        "preview_url": previewUrl == null ? null : previewUrl,
        "remote_url": remoteUrl == null ? null : remoteUrl,
        "text_url": textUrl == null ? null : textUrl,
        "type": type == null ? null : type,
        "url": url == null ? null : url,
    };
}

class Pleroma {
    String mimeType;

    Pleroma({
        this.mimeType,
    });

    factory Pleroma.fromJson(Map<String, dynamic> json) => Pleroma(
        mimeType: json["mime_type"] == null ? null : json["mime_type"],
    );

    Map<String, dynamic> toJson() => {
        "mime_type": mimeType == null ? null : mimeType,
    };
}

