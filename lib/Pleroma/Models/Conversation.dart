// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Conversation.g.dart';

@JsonSerializable()
class Conversation {
    bool unread;
    @JsonKey(name: "last_status")
    Status lastStatus;
    String id;
    List<Account> accounts;

    Conversation({
        this.unread,
        this.lastStatus,
        this.id,
        this.accounts,
    });

    factory Conversation.fromJson(Map<String, dynamic> json) =>
        _$ConversationFromJson(json);

    factory Conversation.fromJsonString(String jsonString) =>
        _$ConversationFromJson(jsonDecode(jsonString));

    static List<Conversation> listFromJsonString(String str) =>
        new List<Conversation>.from(json.decode(str).map((x) => Conversation.fromJson(x)));


    Map<String, dynamic> toJson() => _$ConversationToJson(this);
    String toJsonString() => jsonEncode(_$ConversationToJson(this));

}
