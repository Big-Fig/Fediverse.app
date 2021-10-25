import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/chat/message/post/unifedi_api_post_chat_message_model.dart';

part 'unifedi_api_post_chat_message_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_post_chat_message_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPostChatMessagePleromaAdapter
    with _$UnifediApiPostChatMessagePleromaAdapter
    implements IUnifediApiPostChatMessage {
  const UnifediApiPostChatMessagePleromaAdapter._();
  const factory UnifediApiPostChatMessagePleromaAdapter(
    @HiveField(0) PleromaApiPostChatMessage value,
  ) = _UnifediApiPostChatMessagePleromaAdapter;

  @override
  String? get content => value.content;

  @override
  String? get mediaId => value.mediaId;
  factory UnifediApiPostChatMessagePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPostChatMessagePleromaAdapterFromJson(json);
}

extension PleromaApiPostChatMessageUnifediExtension
    on IPleromaApiPostChatMessage {
  UnifediApiPostChatMessagePleromaAdapter
      toUnifediApiPostChatMessagePleromaAdapter() =>
          UnifediApiPostChatMessagePleromaAdapter(
            toPleromaApiPostChatMessage(),
          );
}

extension PleromaApiPostChatMessageUnifediListExtension
    on List<IPleromaApiPostChatMessage> {
  List<UnifediApiPostChatMessagePleromaAdapter>
      toUnifediApiPostChatMessagePleromaAdapterList() => map(
            (item) => item.toUnifediApiPostChatMessagePleromaAdapter(),
          ).toList();
}
