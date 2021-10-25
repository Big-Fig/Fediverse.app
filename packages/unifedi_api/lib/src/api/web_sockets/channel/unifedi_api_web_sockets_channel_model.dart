import 'type/unifedi_api_web_sockets_channel_type_sealed.dart';

abstract class IUnifediApiWebSocketsChannel {
  String get type;

  bool? get localOnly;

  bool? get remoteOnly;

  bool? get mediaOnly;

  String? get onlyFromInstance;

  String? get fromAccountIdOnly;

  bool? get chatOnly;

  bool? get notificationOnly;

  String? get listIdOnly;

  String? get tag;
}

extension IUnifediApiWebSocketsChannelExtension
    on IUnifediApiWebSocketsChannel {
  UnifediApiWebSocketsChannelType get typeAsUnifediApi =>
      UnifediApiWebSocketsChannelType.fromStringValue(
        type,
      );
}
