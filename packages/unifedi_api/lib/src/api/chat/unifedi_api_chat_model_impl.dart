import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import './message/unifedi_api_chat_message_model_impl.dart';
import '../account/unifedi_api_account_model_impl.dart';
import 'unifedi_api_chat_model.dart';

part 'unifedi_api_chat_model_impl.freezed.dart';

part 'unifedi_api_chat_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiChat with _$UnifediApiChat implements IUnifediApiChat {
  const factory UnifediApiChat({
    @HiveField(0) required String id,
    @HiveField(1) required int unread,
    @HiveField(2) @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @HiveField(3) required UnifediApiAccount account,
    @HiveField(4)
    @JsonKey(name: 'last_message')
        required UnifediApiChatMessage? lastMessage,
  }) = _UnifediApiChat;

  factory UnifediApiChat.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiChatFromJson(json);
}

extension IUnifediApiChatInterfaceExtension on IUnifediApiChat {
  UnifediApiChat toUnifediApiChat({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiChat(
          id: id,
          unread: unread,
          updatedAt: updatedAt,
          account: account.toUnifediApiAccount(
            forceNewObject: forceNewObject,
          ),
          lastMessage: lastMessage?.toUnifediApiChatMessage(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
