import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/account/unifedi_api_account_model.dart';
import '../../api/conversation/unifedi_api_conversation_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../status/unifedi_api_status_model_pleroma_adapter.dart';

part 'unifedi_api_conversation_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_conversation_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiConversationPleromaAdapter
    with _$UnifediApiConversationPleromaAdapter
    implements IUnifediApiConversation {
  const UnifediApiConversationPleromaAdapter._();
  const factory UnifediApiConversationPleromaAdapter(
    @HiveField(0) PleromaApiConversation value,
  ) = _UnifediApiConversationPleromaAdapter;

  @override
  List<IUnifediApiAccount> get accounts =>
      value.accounts.toUnifediApiAccountPleromaAdapterList();

  @override
  String get id => value.id;

  @override
  IUnifediApiStatus? get lastStatus =>
      value.lastStatus?.toUnifediApiStatusPleromaAdapter();

  @override
  List<IUnifediApiAccount>? get recipients =>
      value.pleroma?.recipients?.toUnifediApiAccountPleromaAdapterList();

  @override
  bool? get unread => value.unread;
  factory UnifediApiConversationPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiConversationPleromaAdapterFromJson(json);
}

extension PleromaApiConversationUnifediExtension on IPleromaApiConversation {
  UnifediApiConversationPleromaAdapter
      toUnifediApiConversationPleromaAdapter() =>
          UnifediApiConversationPleromaAdapter(
            toPleromaApiConversation(),
          );
}

extension PleromaApiConversationUnifediListExtension
    on List<IPleromaApiConversation> {
  List<UnifediApiConversationPleromaAdapter>
      toUnifediApiConversationPleromaAdapterList() => map(
            (item) => item.toUnifediApiConversationPleromaAdapter(),
          ).toList();
}
