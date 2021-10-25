import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'type/unifedi_api_web_sockets_channel_type_sealed.dart';
import 'unifedi_api_web_sockets_channel_model.dart';
// ignore_for_file: no-magic-number
part 'unifedi_api_web_sockets_channel_model_impl.freezed.dart';

part 'unifedi_api_web_sockets_channel_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiWebSocketsChannel
    with _$UnifediApiWebSocketsChannel
    implements IUnifediApiWebSocketsChannel {
  @Assert('!(chatOnly == true && notificationOnly == true)')
  @Assert('!(localOnly == true && remoteOnly == true)')
  const factory UnifediApiWebSocketsChannel({
    @HiveField(0) required String type,
    @HiveField(1) @JsonKey(name: 'local_only') required bool? localOnly,
    @HiveField(2) @JsonKey(name: 'remote_only') required bool? remoteOnly,
    @HiveField(3) @JsonKey(name: 'media_only') required bool? mediaOnly,
    @HiveField(4)
    @JsonKey(name: 'only_from_instance')
        required String? onlyFromInstance,
    @HiveField(5)
    @JsonKey(name: 'from_account_id_only')
        required String? fromAccountIdOnly,
    @HiveField(6) @JsonKey(name: 'chat_only') required bool? chatOnly,
    @HiveField(7)
    @JsonKey(name: 'notification_only')
        required bool? notificationOnly,
    @HiveField(8) @JsonKey(name: 'list_id_only') required String? listIdOnly,
    @HiveField(9) required String? tag,
  }) = _UnifediApiWebSocketsChannel;

  static UnifediApiWebSocketsChannel public({
    required bool localOnly,
    required bool remoteOnly,
    required bool mediaOnly,
    required String? onlyFromInstance,
  }) =>
      UnifediApiWebSocketsChannel(
        type: UnifediApiWebSocketsChannelType.publicValue.stringValue,
        localOnly: localOnly,
        remoteOnly: remoteOnly,
        mediaOnly: mediaOnly,
        onlyFromInstance: onlyFromInstance,
        fromAccountIdOnly: null,
        chatOnly: null,
        notificationOnly: null,
        listIdOnly: null,
        tag: null,
      );

  static UnifediApiWebSocketsChannel direct({
    required String? fromAccountIdOnly,
  }) =>
      UnifediApiWebSocketsChannel(
        type: UnifediApiWebSocketsChannelType.directValue.stringValue,
        localOnly: null,
        remoteOnly: null,
        mediaOnly: null,
        onlyFromInstance: null,
        fromAccountIdOnly: fromAccountIdOnly,
        chatOnly: null,
        notificationOnly: null,
        listIdOnly: null,
        tag: null,
      );

  static UnifediApiWebSocketsChannel user({
    required bool chatOnly,
    required bool notificationOnly,
  }) =>
      UnifediApiWebSocketsChannel(
        type: UnifediApiWebSocketsChannelType.userValue.stringValue,
        localOnly: null,
        remoteOnly: null,
        mediaOnly: null,
        onlyFromInstance: null,
        fromAccountIdOnly: null,
        chatOnly: chatOnly,
        notificationOnly: notificationOnly,
        listIdOnly: null,
        tag: null,
      );

  static UnifediApiWebSocketsChannel list({
    required String listIdOnly,
  }) =>
      UnifediApiWebSocketsChannel(
        type: UnifediApiWebSocketsChannelType.listValue.stringValue,
        localOnly: null,
        remoteOnly: null,
        mediaOnly: null,
        onlyFromInstance: null,
        fromAccountIdOnly: null,
        chatOnly: null,
        notificationOnly: null,
        listIdOnly: listIdOnly,
        tag: null,
      );

  static UnifediApiWebSocketsChannel hashtag({
    required bool localOnly,
    required String tag,
  }) =>
      UnifediApiWebSocketsChannel(
        type: UnifediApiWebSocketsChannelType.hashtagValue.stringValue,
        localOnly: localOnly,
        remoteOnly: null,
        mediaOnly: null,
        onlyFromInstance: null,
        fromAccountIdOnly: null,
        chatOnly: null,
        notificationOnly: null,
        listIdOnly: null,
        tag: tag,
      );

  factory UnifediApiWebSocketsChannel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiWebSocketsChannelFromJson(json);
}

extension IUnifediApiWebSocketsChannelInterfaceExtension
    on IUnifediApiWebSocketsChannel {
  UnifediApiWebSocketsChannel toUnifediApiWebSocketsChannel({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiWebSocketsChannel(
          type: type,
          localOnly: localOnly,
          remoteOnly: remoteOnly,
          mediaOnly: mediaOnly,
          onlyFromInstance: onlyFromInstance,
          fromAccountIdOnly: fromAccountIdOnly,
          chatOnly: chatOnly,
          notificationOnly: notificationOnly,
          listIdOnly: listIdOnly,
          tag: tag,
        ),
        forceNewObject: forceNewObject,
      );
}
