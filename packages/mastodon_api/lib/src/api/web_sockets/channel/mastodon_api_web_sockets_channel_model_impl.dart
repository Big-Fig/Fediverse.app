import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'mastodon_api_web_sockets_channel_model.dart';
import 'type/mastodon_api_web_sockets_channel_type_sealed.dart';
// ignore_for_file: no-magic-number
part 'mastodon_api_web_sockets_channel_model_impl.freezed.dart';

part 'mastodon_api_web_sockets_channel_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiWebSocketsChannel
    with _$MastodonApiWebSocketsChannel
    implements IMastodonApiWebSocketsChannel {
  const factory MastodonApiWebSocketsChannel({
    @HiveField(0) required String type,
    @HiveField(1) @JsonKey(name: 'local_only') required bool? localOnly,
    @HiveField(2) @JsonKey(name: 'media_only') required bool? mediaOnly,
    @HiveField(3)
    @JsonKey(name: 'from_account_id_only')
        required String? fromAccountIdOnly,
    @HiveField(4)
    @JsonKey(name: 'notification_only')
        required bool? notificationOnly,
    @HiveField(5) @JsonKey(name: 'list_id_only') required String? listIdOnly,
    @HiveField(6) required String? tag,
  }) = _MastodonApiWebSocketsChannel;

  static MastodonApiWebSocketsChannel public({
    required bool localOnly,
    required bool mediaOnly,
  }) =>
      MastodonApiWebSocketsChannel(
        type: MastodonApiWebSocketsChannelType.publicValue.stringValue,
        localOnly: localOnly,
        mediaOnly: mediaOnly,
        fromAccountIdOnly: null,
        notificationOnly: null,
        listIdOnly: null,
        tag: null,
      );

  static MastodonApiWebSocketsChannel direct({
    required String? fromAccountIdOnly,
  }) =>
      MastodonApiWebSocketsChannel(
        type: MastodonApiWebSocketsChannelType.directValue.stringValue,
        localOnly: null,
        mediaOnly: null,
        fromAccountIdOnly: fromAccountIdOnly,
        notificationOnly: null,
        listIdOnly: null,
        tag: null,
      );

  static MastodonApiWebSocketsChannel user({
    required bool notificationOnly,
  }) =>
      MastodonApiWebSocketsChannel(
        type: MastodonApiWebSocketsChannelType.userValue.stringValue,
        localOnly: null,
        mediaOnly: null,
        fromAccountIdOnly: null,
        notificationOnly: notificationOnly,
        listIdOnly: null,
        tag: null,
      );

  static MastodonApiWebSocketsChannel list({
    required String listIdOnly,
  }) =>
      MastodonApiWebSocketsChannel(
        type: MastodonApiWebSocketsChannelType.listValue.stringValue,
        localOnly: null,
        mediaOnly: null,
        fromAccountIdOnly: null,
        notificationOnly: null,
        listIdOnly: listIdOnly,
        tag: null,
      );

  static MastodonApiWebSocketsChannel hashtag({
    required bool localOnly,
    required String tag,
  }) =>
      MastodonApiWebSocketsChannel(
        type: MastodonApiWebSocketsChannelType.hashtagValue.stringValue,
        localOnly: localOnly,
        mediaOnly: null,
        fromAccountIdOnly: null,
        notificationOnly: null,
        listIdOnly: null,
        tag: tag,
      );

  factory MastodonApiWebSocketsChannel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiWebSocketsChannelFromJson(json);
}

extension IMastodonApiWebSocketsChannelInterfaceExtension
    on IMastodonApiWebSocketsChannel {
  MastodonApiWebSocketsChannel toMastodonApiWebSocketsChannel({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiWebSocketsChannel(
          type: type,
          localOnly: localOnly,
          mediaOnly: mediaOnly,
          fromAccountIdOnly: fromAccountIdOnly,
          notificationOnly: notificationOnly,
          listIdOnly: listIdOnly,
          tag: tag,
        ),
        forceNewObject: forceNewObject,
      );
}
