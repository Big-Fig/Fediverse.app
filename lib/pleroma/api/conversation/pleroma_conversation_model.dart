import 'dart:convert';

import 'package:fedi/mastodon/api/conversation/mastodon_api_conversation_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_conversation_model.g.dart';

abstract class IPleromaConversation extends IMastodonApiConversation {
  @override
  IPleromaStatus? get lastStatus;

  @override
  List<IPleromaAccount> get accounts;

  IPleromaConversationPleromaPart? get pleroma;
}

abstract class IPleromaConversationPleromaPart {
  List<IPleromaAccount>? get recipients;
}

extension IPleromaConversationPleromaPartExtension
    on IPleromaConversationPleromaPart {
  PleromaConversationPleromaPart toPleromaConversationPleromaPart() {
    if (PleromaConversationPleromaPart is PleromaConversationPleromaPart) {
      return this as PleromaConversationPleromaPart;
    } else {
      return PleromaConversationPleromaPart(
        recipients: recipients?.toPleromaAccounts(),
      );
    }
  }
}

@JsonSerializable()
class PleromaConversationPleromaPart extends IPleromaConversationPleromaPart {
  @override
  final List<PleromaAccount>? recipients;

  PleromaConversationPleromaPart({
    required this.recipients,
  });

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
  final bool? unread;
  @JsonKey(name: "last_status")
  @override
  final PleromaStatus? lastStatus;
  @override
  final String id;
  @override
  final List<PleromaAccount> accounts;
  @override
  final PleromaConversationPleromaPart? pleroma;

  PleromaConversation({
    required this.unread,
    required this.lastStatus,
    required this.id,
    required List<PleromaAccount>? accounts,
    required this.pleroma,
  }) : accounts = accounts ?? [];

  factory PleromaConversation.fromJson(Map<String, dynamic> json) =>
      _$PleromaConversationFromJson(json);

  factory PleromaConversation.fromJsonString(String jsonString) =>
      _$PleromaConversationFromJson(jsonDecode(jsonString));

  static List<PleromaConversation> listFromJsonString(String str) =>
      List<PleromaConversation>.from(
        json.decode(str).map((x) => PleromaConversation.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaConversationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaConversationToJson(this));
}
