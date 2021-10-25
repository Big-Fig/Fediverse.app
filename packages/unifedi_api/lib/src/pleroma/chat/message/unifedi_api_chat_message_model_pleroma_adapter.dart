import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/card/unifedi_api_card_model.dart';
import '../../../api/chat/message/unifedi_api_chat_message_model.dart';
import '../../../api/emoji/unifedi_api_emoji_model.dart';
import '../../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import '../../card/unifedi_api_card_model_pleroma_adapter.dart';
import '../../emoji/unifedi_api_emoji_model_pleroma_adapter.dart';
import '../../media/attachment/unifedi_api_media_attachment_model_pleroma_adapter.dart';

part 'unifedi_api_chat_message_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_chat_message_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiChatMessagePleromaAdapter
    with _$UnifediApiChatMessagePleromaAdapter
    implements IUnifediApiChatMessage {
  const UnifediApiChatMessagePleromaAdapter._();
  const factory UnifediApiChatMessagePleromaAdapter(
    @HiveField(0) PleromaApiChatMessage value,
  ) = _UnifediApiChatMessagePleromaAdapter;

  @override
  String get accountId => value.accountId;

  @override
  IUnifediApiCard? get card => value.card?.toUnifediApiCardPleromaAdapter();

  @override
  String get chatId => value.chatId;

  @override
  String? get content => value.content;

  @override
  DateTime get createdAt => value.createdAt;

  @override
  List<IUnifediApiEmoji>? get emojis =>
      value.emojis?.toUnifediApiEmojiPleromaAdapterList();

  @override
  String get id => value.id;

  @override
  IUnifediApiMediaAttachment? get mediaAttachment =>
      value.mediaAttachment?.toUnifediApiMediaAttachmentPleromaAdapter();
  factory UnifediApiChatMessagePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiChatMessagePleromaAdapterFromJson(json);
}

extension PleromaApiChatMessageUnifediExtension on IPleromaApiChatMessage {
  UnifediApiChatMessagePleromaAdapter toUnifediApiChatMessagePleromaAdapter() =>
      UnifediApiChatMessagePleromaAdapter(
        toPleromaApiChatMessage(),
      );
}

extension PleromaApiChatMessageUnifediListExtension
    on List<IPleromaApiChatMessage> {
  List<UnifediApiChatMessagePleromaAdapter>
      toUnifediApiChatMessagePleromaAdapterList() => map(
            (item) => item.toUnifediApiChatMessagePleromaAdapter(),
          ).toList();
}
