import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/mastodon_api_account_model_impl.dart';
import '../status/mastodon_api_status_model_impl.dart';
import 'mastodon_api_conversation_model.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_conversation_model_impl.freezed.dart';

part 'mastodon_api_conversation_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiConversation
    with _$MastodonApiConversation
    implements IMastodonApiConversation {
  const factory MastodonApiConversation({
    @HiveField(0) required bool? unread,
    @HiveField(1)
    @JsonKey(name: 'last_status')
        required MastodonApiStatus? lastStatus,
    @HiveField(2) required String id,
    @HiveField(3) required List<MastodonApiAccount> accounts,
  }) = _MastodonApiConversation;

  factory MastodonApiConversation.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiConversationFromJson(json);
}

extension IMastodonApiConversationInterfaceExtension
    on IMastodonApiConversation {
  MastodonApiConversation toMastodonApiConversation({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiConversation(
          unread: unread,
          lastStatus: lastStatus?.toMastodonApiStatus(
            forceNewObject: forceNewObject,
          ),
          id: id,
          accounts: accounts.toMastodonApiAccountList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
