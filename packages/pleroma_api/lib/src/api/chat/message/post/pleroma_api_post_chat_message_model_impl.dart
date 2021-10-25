import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'pleroma_api_post_chat_message_model.dart';

part 'pleroma_api_post_chat_message_model_impl.freezed.dart';

part 'pleroma_api_post_chat_message_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiPostChatMessage
    with _$PleromaApiPostChatMessage
    implements IPleromaApiPostChatMessage {
  const factory PleromaApiPostChatMessage({
    @HiveField(0) required String? content,
    @HiveField(1) @JsonKey(name: 'media_id') required String? mediaId,
  }) = _PleromaApiPostChatMessage;

  factory PleromaApiPostChatMessage.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPostChatMessageFromJson(json);
}

extension IPleromaApiPostChatMessageInterfaceExtension
    on IPleromaApiPostChatMessage {
  PleromaApiPostChatMessage toPleromaApiPostChatMessage({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPostChatMessage(
          mediaId: mediaId,
          content: content,
        ),
        forceNewObject: forceNewObject,
      );
}
