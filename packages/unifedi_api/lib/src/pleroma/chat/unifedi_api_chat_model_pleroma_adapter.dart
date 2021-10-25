import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/account/unifedi_api_account_model.dart';
import '../../api/chat/message/unifedi_api_chat_message_model.dart';
import '../../api/chat/unifedi_api_chat_model.dart';
import '../account/unifedi_api_account_model_pleroma_adapter.dart';
import 'message/unifedi_api_chat_message_model_pleroma_adapter.dart';

part 'unifedi_api_chat_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_chat_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiChatPleromaAdapter
    with _$UnifediApiChatPleromaAdapter
    implements IUnifediApiChat {
  const UnifediApiChatPleromaAdapter._();
  const factory UnifediApiChatPleromaAdapter(
    @HiveField(0) PleromaApiChat value,
  ) = _UnifediApiChatPleromaAdapter;

  @override
  IUnifediApiAccount get account =>
      value.account.toUnifediApiAccountPleromaAdapter();

  @override
  String get id => value.id;

  @override
  IUnifediApiChatMessage? get lastMessage =>
      value.lastMessage?.toUnifediApiChatMessagePleromaAdapter();

  @override
  int get unread => value.unread;

  @override
  DateTime? get updatedAt => value.updatedAt;
  factory UnifediApiChatPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiChatPleromaAdapterFromJson(json);
}

extension PleromaApiChatUnifediExtension on IPleromaApiChat {
  UnifediApiChatPleromaAdapter toUnifediApiChatPleromaAdapter() =>
      UnifediApiChatPleromaAdapter(
        toPleromaApiChat(),
      );
}

extension PleromaApiChatUnifediListExtension on List<IPleromaApiChat> {
  List<UnifediApiChatPleromaAdapter> toUnifediApiChatPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiChatPleromaAdapter(),
      ).toList();
}
