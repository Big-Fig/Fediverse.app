import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/unifedi_api_account_model_impl.dart';
import '../status/unifedi_api_status_model_impl.dart';
import 'unifedi_api_conversation_model.dart';

part 'unifedi_api_conversation_model_impl.freezed.dart';

part 'unifedi_api_conversation_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiConversation
    with _$UnifediApiConversation
    implements IUnifediApiConversation {
  const factory UnifediApiConversation({
    @HiveField(0) required bool? unread,
    @HiveField(1)
    @JsonKey(name: 'last_status')
        required UnifediApiStatus? lastStatus,
    @HiveField(2) required String id,
    @HiveField(3) required List<UnifediApiAccount> accounts,
    @HiveField(4) required List<UnifediApiAccount>? recipients,
  }) = _UnifediApiConversation;

  factory UnifediApiConversation.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiConversationFromJson(json);
}

extension IUnifediApiConversationInterfaceExtension on IUnifediApiConversation {
  UnifediApiConversation toUnifediApiConversation({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiConversation(
          unread: unread,
          lastStatus: lastStatus?.toUnifediApiStatus(
            forceNewObject: forceNewObject,
          ),
          id: id,
          accounts: accounts.toUnifediApiAccountList(
            forceNewObject: forceNewObject,
          ),
          recipients: recipients?.toUnifediApiAccountList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
