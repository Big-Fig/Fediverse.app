import 'dart:convert';

import 'package:fedi/refactored/mastodon/conversation/mastodon_conversation_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_conversation_model.g.dart';

abstract class IPleromaConversation extends IMastodonConversation {
  @override
  IPleromaStatus get lastStatus;

  @override
  List<IPleromaAccount> get accounts;

  IPleromaConversationPleromaPart get pleroma;
}

abstract class IPleromaConversationPleromaPart {
  List<IPleromaAccount> get recipients;
}

@JsonSerializable()
class PleromaConversationPleromaPart extends IPleromaConversationPleromaPart {
  @override
  final List<PleromaAccount> recipients;

  PleromaConversationPleromaPart({this.recipients});

  factory PleromaConversationPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaConversationPleromaPartFromJson(json);

  factory PleromaConversationPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaConversationPleromaPartFromJson(jsonDecode(jsonString));

  static List<PleromaConversationPleromaPart> listFromJsonString(String str) =>
      List<PleromaConversationPleromaPart>.from(json
          .decode(str)
          .map((x) => PleromaConversationPleromaPart.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaConversationPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaConversationPleromaPartToJson(this));
}

@JsonSerializable()
class PleromaConversation implements IPleromaConversation {
  @override
  final bool unread;
  @JsonKey(name: "last_status")
  @override
  final PleromaStatus lastStatus;
  @override
  final String id;
  @override
  final List<PleromaAccount> accounts;
  @override
  final PleromaConversationPleromaPart pleroma;

  PleromaConversation({
    this.unread,
    this.lastStatus,
    this.id,
    this.accounts,
    this.pleroma,
  });

  factory PleromaConversation.fromJson(Map<String, dynamic> json) =>
      _$PleromaConversationFromJson(json);

  factory PleromaConversation.fromJsonString(String jsonString) =>
      _$PleromaConversationFromJson(jsonDecode(jsonString));

  static List<PleromaConversation> listFromJsonString(String str) =>
      List<PleromaConversation>.from(
          json.decode(str).map((x) => PleromaConversation.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaConversationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaConversationToJson(this));
}
