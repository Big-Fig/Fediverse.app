// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Status.dart';

List<Conversation> conversationFromJson(String str) => new List<Conversation>.from(json.decode(str).map((x) => Conversation.fromJson(x)));

String conversationToJson(List<Conversation> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Conversation {
    bool unread;
    Status lastStatus;
    String id;
    List<Account> accounts;

    Conversation({
        this.unread,
        this.lastStatus,
        this.id,
        this.accounts,
    });

    factory Conversation.fromJson(Map<String, dynamic> json) => new Conversation(
        unread: json["unread"],
        lastStatus: Status.fromJson(json["last_status"]),
        id: json["id"],
        accounts: new List<Account>.from(json["accounts"].map((x) => Account.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "unread": unread,
        "last_status": lastStatus.toJson(),
        "id": id,
        "accounts": new List<dynamic>.from(accounts.map((x) => x.toJson())),
    };
}
