import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/account/unifedi_api_account_model.dart';
import '../../api/conversation/unifedi_api_conversation_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../status/unifedi_api_status_model_mastodon_adapter.dart';

part 'unifedi_api_conversation_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_conversation_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiConversationMastodonAdapter
    with _$UnifediApiConversationMastodonAdapter
    implements IUnifediApiConversation {
  const UnifediApiConversationMastodonAdapter._();
  const factory UnifediApiConversationMastodonAdapter(
    @HiveField(0) MastodonApiConversation value,
  ) = _UnifediApiConversationMastodonAdapter;

  @override
  List<IUnifediApiAccount> get accounts =>
      value.accounts.toUnifediApiAccountMastodonAdapterList();

  @override
  String get id => value.id;

  @override
  IUnifediApiStatus? get lastStatus =>
      value.lastStatus?.toUnifediApiStatusMastodonAdapter();

  @override
  List<IUnifediApiAccount>? get recipients => null;

  @override
  bool? get unread => value.unread;
  factory UnifediApiConversationMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiConversationMastodonAdapterFromJson(json);
}

extension MastodonApiConversationUnifediExtension on IMastodonApiConversation {
  UnifediApiConversationMastodonAdapter
      toUnifediApiConversationMastodonAdapter() =>
          UnifediApiConversationMastodonAdapter(
            toMastodonApiConversation(),
          );
}

extension MastodonApiConversationUnifediListExtension
    on List<IMastodonApiConversation> {
  List<UnifediApiConversationMastodonAdapter>
      toUnifediApiConversationMastodonAdapterList() => map(
            (item) => item.toUnifediApiConversationMastodonAdapter(),
          ).toList();
}
