import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'pleroma_api_web_sockets_channel_model.dart';
import 'type/pleroma_api_web_sockets_channel_type_sealed.dart';
// ignore_for_file: no-magic-number
part 'pleroma_api_web_sockets_channel_model_impl.freezed.dart';

part 'pleroma_api_web_sockets_channel_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiWebSocketsChannel
    with _$PleromaApiWebSocketsChannel
    implements IPleromaApiWebSocketsChannel {
  @Assert('!(chatOnly == true && notificationOnly == true)')
  @Assert('!(localOnly == true && remoteOnly == true)')
  const factory PleromaApiWebSocketsChannel({
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
  }) = _PleromaApiWebSocketsChannel;

  static PleromaApiWebSocketsChannel public({
    required bool localOnly,
    required bool? remoteOnly,
    required bool mediaOnly,
    required String? onlyFromInstance,
  }) =>
      PleromaApiWebSocketsChannel(
        type: PleromaApiWebSocketsChannelType.publicValue.stringValue,
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

  static PleromaApiWebSocketsChannel direct({
    required String? fromAccountIdOnly,
  }) =>
      PleromaApiWebSocketsChannel(
        type: PleromaApiWebSocketsChannelType.directValue.stringValue,
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

  static PleromaApiWebSocketsChannel user({
    required bool chatOnly,
    required bool notificationOnly,
  }) =>
      PleromaApiWebSocketsChannel(
        type: PleromaApiWebSocketsChannelType.userValue.stringValue,
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

  static PleromaApiWebSocketsChannel list({
    required String listIdOnly,
  }) =>
      PleromaApiWebSocketsChannel(
        type: PleromaApiWebSocketsChannelType.listValue.stringValue,
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

  static PleromaApiWebSocketsChannel hashtag({
    required bool localOnly,
    required String tag,
  }) =>
      PleromaApiWebSocketsChannel(
        type: PleromaApiWebSocketsChannelType.hashtagValue.stringValue,
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

  factory PleromaApiWebSocketsChannel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiWebSocketsChannelFromJson(json);
}

extension IPleromaApiWebSocketsChannelInterfaceExtension
    on IPleromaApiWebSocketsChannel {
  PleromaApiWebSocketsChannel toPleromaApiWebSocketsChannel({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiWebSocketsChannel(
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
