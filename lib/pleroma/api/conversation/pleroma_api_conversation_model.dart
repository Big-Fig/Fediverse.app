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
    if (PleromaApiConversationPleromaPart
        is PleromaApiConversationPleromaPart) {
      return this as PleromaApiConversationPleromaPart;
    } else {
      return PleromaApiConversationPleromaPart(
        recipients: recipients?.toPleromaApiAccounts(),
      );
    }
  }
}

@JsonSerializable()
class PleromaApiConversationPleromaPart
    extends IPleromaApiConversationPleromaPart {
  @override
  final List<PleromaApiAccount>? recipients;

  PleromaApiConversationPleromaPart({
    required this.recipients,
  });

  static PleromaApiConversationPleromaPart fromJson(
          Map<String, dynamic> json) =>
      _$PleromaApiConversationPleromaPartFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PleromaApiConversationPleromaPartToJson(this);
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
    // todo: wtf? check
    required List<PleromaApiAccount>? accounts,
    required this.pleroma,
  }) : accounts = accounts ?? [];

  static PleromaApiConversation fromJson(Map<String, dynamic> json) =>
      _$PleromaApiConversationFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiConversationToJson(this);

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
