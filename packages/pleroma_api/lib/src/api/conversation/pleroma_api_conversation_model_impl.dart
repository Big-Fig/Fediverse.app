import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/pleroma_api_account_model_impl.dart';
import '../status/pleroma_api_status_model_impl.dart';
import 'pleroma_api_conversation_model.dart';

part 'pleroma_api_conversation_model_impl.freezed.dart';

part 'pleroma_api_conversation_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiConversationPleromaPart
    with _$PleromaApiConversationPleromaPart
    implements IPleromaApiConversationPleromaPart {
  const factory PleromaApiConversationPleromaPart({
    @HiveField(0) required List<PleromaApiAccount>? recipients,
  }) = _PleromaApiConversationPleromaPart;

  factory PleromaApiConversationPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiConversationPleromaPartFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiConversation
    with _$PleromaApiConversation
    implements IPleromaApiConversation {
  const factory PleromaApiConversation({
    @HiveField(0) required bool? unread,
    @HiveField(1)
    @JsonKey(name: 'last_status')
        required PleromaApiStatus? lastStatus,
    @HiveField(2) required String id,
    @HiveField(3) required List<PleromaApiAccount> accounts,
    @HiveField(4) required PleromaApiConversationPleromaPart? pleroma,
  }) = _PleromaApiConversation;

  factory PleromaApiConversation.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiConversationFromJson(json);
}

extension IPleromaApiConversationPleromaPartInterfaceExtension
    on IPleromaApiConversationPleromaPart {
  PleromaApiConversationPleromaPart toPleromaApiConversationPleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiConversationPleromaPart(
          recipients: recipients?.toPleromaApiAccountList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiConversationInterfaceExtension on IPleromaApiConversation {
  PleromaApiConversation toPleromaApiConversation({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiConversation(
          unread: unread,
          lastStatus: lastStatus?.toPleromaApiStatus(
            forceNewObject: forceNewObject,
          ),
          id: id,
          accounts: accounts.toPleromaApiAccountList(
            forceNewObject: forceNewObject,
          ),
          pleroma: pleroma?.toPleromaApiConversationPleromaPart(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
