import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/web_sockets/channel/unifedi_api_web_sockets_channel_model.dart';
import 'type/unifedi_api_web_sockets_channel_type_sealed_pleroma_converter.dart';

part 'unifedi_api_web_sockets_channel_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_web_sockets_channel_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiWebSocketsChannelPleromaAdapter
    with _$UnifediApiWebSocketsChannelPleromaAdapter
    implements IUnifediApiWebSocketsChannel {
  const UnifediApiWebSocketsChannelPleromaAdapter._();
  const factory UnifediApiWebSocketsChannelPleromaAdapter(
    @HiveField(0) PleromaApiWebSocketsChannel value,
  ) = _UnifediApiWebSocketsChannelPleromaAdapter;

  @override
  String get type =>
      value.typeAsPleromaApi.toUnifediApiWebSocketsChannelType().stringValue;

  @override
  bool? get localOnly => value.localOnly;

  @override
  bool? get remoteOnly => value.remoteOnly;

  @override
  bool? get mediaOnly => value.mediaOnly;

  @override
  String? get onlyFromInstance => value.onlyFromInstance;

  @override
  String? get fromAccountIdOnly => value.fromAccountIdOnly;

  @override
  bool? get chatOnly => value.chatOnly;

  @override
  bool? get notificationOnly => value.notificationOnly;

  @override
  String? get listIdOnly => value.listIdOnly;

  @override
  String? get tag => value.tag;
  factory UnifediApiWebSocketsChannelPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiWebSocketsChannelPleromaAdapterFromJson(json);
}

extension PleromaApiWebSocketsChannelUnifediExtension
    on IPleromaApiWebSocketsChannel {
  UnifediApiWebSocketsChannelPleromaAdapter
      toUnifediApiWebSocketsChannelPleromaAdapter() =>
          UnifediApiWebSocketsChannelPleromaAdapter(
            toPleromaApiWebSocketsChannel(),
          );
}
