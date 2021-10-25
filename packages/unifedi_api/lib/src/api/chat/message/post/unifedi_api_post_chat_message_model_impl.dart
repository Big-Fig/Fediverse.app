import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'unifedi_api_post_chat_message_model.dart';

part 'unifedi_api_post_chat_message_model_impl.freezed.dart';

part 'unifedi_api_post_chat_message_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiPostChatMessage
    with _$UnifediApiPostChatMessage
    implements IUnifediApiPostChatMessage {
  const factory UnifediApiPostChatMessage({
    @HiveField(0) required String? content,
    @HiveField(1) @JsonKey(name: 'media_id') required String? mediaId,
  }) = _UnifediApiPostChatMessage;

  factory UnifediApiPostChatMessage.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiPostChatMessageFromJson(json);
}

extension IUnifediApiPostChatMessageInterfaceExtension
    on IUnifediApiPostChatMessage {
  UnifediApiPostChatMessage toUnifediApiPostChatMessage({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPostChatMessage(
          mediaId: mediaId,
          content: content,
        ),
        forceNewObject: forceNewObject,
      );
}
