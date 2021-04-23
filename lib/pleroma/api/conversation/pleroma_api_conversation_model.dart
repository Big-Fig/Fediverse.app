import 'dart:convert';

import 'package:fedi/mastodon/api/conversation/mastodon_api_conversation_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_conversation_model.g.dart';

abstract class IPleromaApiConversation extends IMastodonApiConversation {
  @override
  IPleromaApiStatus? get lastStatus;

  @override
  List<IPleromaApiAccount> get accounts;

  IPleromaApiConversationPleromaPart? get pleroma;
}

abstract class IPleromaApiConversationPleromaPart {
  List<IPleromaApiAccount>? get recipients;
}

extension IPleromaApiConversationPleromaPartExtension
    on IPleromaApiConversationPleromaPart {
  PleromaApiConversationPleromaPart toPleromaApiConversationPleromaPart() {
    if (PleromaApiConversationPleromaPart is PleromaApiConversationPleromaPart) {
      return this as PleromaApiConversationPleromaPart;
    } else {
      return PleromaApiConversationPleromaPart(
        recipients: recipients?.toPleromaApiAccounts(),
      );
    }
  }
}

@JsonSerializable()
class PleromaApiConversationPleromaPart extends IPleromaApiConversationPleromaPart {
  @override
  final List<PleromaApiAccount>? recipients;

  PleromaApiConversationPleromaPart({
    required this.recipients,
  });

  factory PleromaApiConversationPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiConversationPleromaPartFromJson(json);

  factory PleromaApiConversationPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaApiConversationPleromaPartFromJson(jsonDecode(jsonString));

  static List<PleromaApiConversationPleromaPart> listFromJsonString(String str) =>
      List<PleromaApiConversationPleromaPart>.from(json
          .decode(str)
          .map((x) => PleromaApiConversationPleromaPart.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaApiConversationPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaApiConversationPleromaPartToJson(this));
}

@JsonSerializable()
class PleromaApiConversation implements IPleromaApiConversation {
  @override
  final bool? unread;
  @JsonKey(name: "last_status")
  @override
  final PleromaApiStatus? lastStatus;
  @override
  final String id;
  @override
  final List<PleromaApiAccount> accounts;
  @override
  final PleromaApiConversationPleromaPart? pleroma;

  PleromaApiConversation({
    required this.unread,
    required this.lastStatus,
    required this.id,
    required List<PleromaApiAccount>? accounts,
    required this.pleroma,
  }) : accounts = accounts ?? [];

  factory PleromaApiConversation.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiConversationFromJson(json);

  factory PleromaApiConversation.fromJsonString(String jsonString) =>
      _$PleromaApiConversationFromJson(jsonDecode(jsonString));

  static List<PleromaApiConversation> listFromJsonString(String str) =>
      List<PleromaApiConversation>.from(
        json.decode(str).map((x) => PleromaApiConversation.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiConversationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiConversationToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiConversation &&
          runtimeType == other.runtimeType &&
          unread == other.unread &&
          lastStatus == other.lastStatus &&
          id == other.id &&
          accounts == other.accounts &&
          pleroma == other.pleroma;

  @override
  int get hashCode =>
      unread.hashCode ^
      lastStatus.hashCode ^
      id.hashCode ^
      accounts.hashCode ^
      pleroma.hashCode;

  @override
  String toString() {
    return 'PleromaApiConversation{'
        'unread: $unread, '
        'lastStatus: $lastStatus, '
        'id: $id, '
        'accounts: $accounts, '
        'pleroma: $pleroma'
        '}';
  }
}
