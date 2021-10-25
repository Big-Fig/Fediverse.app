import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/instance/limits/chat/unifedi_api_instance_chat_limits_model.dart';
import '../../../api/instance/limits/field/unifedi_api_instance_field_limits_model.dart';
import '../../../api/instance/limits/media/unifedi_api_instance_media_limits_model.dart';
import '../../../api/instance/limits/poll/unifedi_api_instance_poll_limits_model.dart';
import '../../../api/instance/limits/status/unifedi_api_instance_status_limits_model.dart';
import '../../../api/instance/limits/unifedi_api_instance_limits_model.dart';
import 'chat/unifedi_api_instance_chat_limits_model_pleroma_adapter.dart';
import 'field/unifedi_api_instance_field_limits_model_pleroma_adapter.dart';
import 'media/unifedi_api_instance_media_limits_model_pleroma_adapter.dart';
import 'poll/unifedi_api_instance_poll_limits_model_pleroma_adapter.dart';
import 'status/unifedi_api_instance_status_limits_model_pleroma_adapter.dart';

part 'unifedi_api_instance_limits_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_limits_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceLimitsPleromaAdapter
    with _$UnifediApiInstanceLimitsPleromaAdapter
    implements IUnifediApiInstanceLimits {
  const UnifediApiInstanceLimitsPleromaAdapter._();
  const factory UnifediApiInstanceLimitsPleromaAdapter(
    @HiveField(0) PleromaApiInstance value,
  ) = _UnifediApiInstanceLimitsPleromaAdapter;

  @override
  IUnifediApiInstanceChatLimits? get chat =>
      value.toUnifediApiInstanceChatLimitsPleromaAdapter();

  @override
  IUnifediApiInstanceFieldLimits? get field =>
      value.pleroma?.metadata?.fieldsLimits
          ?.toUnifediApiInstanceFieldLimitsPleromaAdapter();

  @override
  IUnifediApiInstanceMediaLimits? get media =>
      value.toUnifediApiInstanceMediaLimitsPleromaAdapter();

  @override
  IUnifediApiInstancePollLimits? get poll =>
      value.pollLimits?.toUnifediApiInstancePollLimitsPleromaAdapter();

  @override
  IUnifediApiInstanceStatusLimits? get status =>
      value.toUnifediApiInstanceStatusLimitsPleromaAdapter();
  factory UnifediApiInstanceLimitsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceLimitsPleromaAdapterFromJson(json);
}

extension PleromaApiInstanceUnifediExtension on IPleromaApiInstance {
  UnifediApiInstanceLimitsPleromaAdapter
      toUnifediApiInstanceLimitsPleromaAdapter() =>
          UnifediApiInstanceLimitsPleromaAdapter(
            toPleromaApiInstance(),
          );
}

extension PleromaApiInstanceUnifediListExtension on List<IPleromaApiInstance> {
  List<UnifediApiInstanceLimitsPleromaAdapter>
      toUnifediApiInstanceLimitsPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstanceLimitsPleromaAdapter(),
          ).toList();
}
