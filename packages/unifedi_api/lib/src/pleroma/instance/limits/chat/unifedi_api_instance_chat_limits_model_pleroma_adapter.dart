import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/instance/limits/chat/unifedi_api_instance_chat_limits_model.dart';

part 'unifedi_api_instance_chat_limits_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_instance_chat_limits_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceChatLimitsPleromaAdapter
    with _$UnifediApiInstanceChatLimitsPleromaAdapter
    implements IUnifediApiInstanceChatLimits {
  const UnifediApiInstanceChatLimitsPleromaAdapter._();
  const factory UnifediApiInstanceChatLimitsPleromaAdapter(
    @HiveField(0) PleromaApiInstance value,
  ) = _UnifediApiInstanceChatLimitsPleromaAdapter;

  @override
  int? get messageLimit => value.chatLimit;
  factory UnifediApiInstanceChatLimitsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceChatLimitsPleromaAdapterFromJson(json);
}

extension PleromaApiInstanceUnifediExtension on IPleromaApiInstance {
  UnifediApiInstanceChatLimitsPleromaAdapter
      toUnifediApiInstanceChatLimitsPleromaAdapter() =>
          UnifediApiInstanceChatLimitsPleromaAdapter(
            toPleromaApiInstance(),
          );
}

extension PleromaApiInstanceUnifediListExtension on List<IPleromaApiInstance> {
  List<UnifediApiInstanceChatLimitsPleromaAdapter>
      toUnifediApiInstanceChatLimitsPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstanceChatLimitsPleromaAdapter(),
          ).toList();
}
