import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import './message/pleroma_api_chat_message_model_impl.dart';
import '../account/pleroma_api_account_model_impl.dart';
import 'pleroma_api_chat_model.dart';

part 'pleroma_api_chat_model_impl.freezed.dart';

part 'pleroma_api_chat_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiChat with _$PleromaApiChat implements IPleromaApiChat {
  const factory PleromaApiChat({
    @HiveField(0) required String id,
    @HiveField(1) required int unread,
    @HiveField(2) @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @HiveField(3) required PleromaApiAccount account,
    @HiveField(4)
    @JsonKey(name: 'last_message')
        required PleromaApiChatMessage? lastMessage,
  }) = _PleromaApiChat;

  factory PleromaApiChat.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiChatFromJson(json);
}

extension IPleromaApiChatInterfaceExtension on IPleromaApiChat {
  PleromaApiChat toPleromaApiChat({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiChat(
          id: id,
          unread: unread,
          updatedAt: updatedAt,
          account: account.toPleromaApiAccount(
            forceNewObject: forceNewObject,
          ),
          lastMessage: lastMessage?.toPleromaApiChatMessage(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
