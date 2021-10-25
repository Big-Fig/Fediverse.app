import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/web_sockets/event/type/unifedi_api_web_sockets_event_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiWebSocketsEventTypePleromaConverter();

class UnifediApiWebSocketsEventTypePleromaConverter
    implements
        SealedConverter<UnifediApiWebSocketsEventType,
            PleromaApiWebSocketsEventType> {
  const UnifediApiWebSocketsEventTypePleromaConverter();

  @override
  UnifediApiWebSocketsEventType convertFrom(
    PleromaApiWebSocketsEventType item,
  ) =>
      item.map(
        update: (_) => UnifediApiWebSocketsEventType.updateValue,
        notification: (_) => UnifediApiWebSocketsEventType.notificationValue,
        delete: (_) => UnifediApiWebSocketsEventType.deleteValue,
        filtersChanged: (_) =>
            UnifediApiWebSocketsEventType.filtersChangedValue,
        announcement: (_) => UnifediApiWebSocketsEventType.announcementValue,
        conversation: (_) => UnifediApiWebSocketsEventType.conversationValue,
        pleromaChatUpdate: (_) => UnifediApiWebSocketsEventType.chatUpdateValue,
        pleromaFollowRelationshipsUpdate: (_) =>
            UnifediApiWebSocketsEventType.followRelationshipsUpdateValue,
        unknown: (value) => UnifediApiWebSocketsEventType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiWebSocketsEventType convertTo(
    UnifediApiWebSocketsEventType item,
  ) =>
      item.map(
        update: (_) => PleromaApiWebSocketsEventType.updateValue,
        notification: (_) => PleromaApiWebSocketsEventType.notificationValue,
        delete: (_) => PleromaApiWebSocketsEventType.deleteValue,
        filtersChanged: (_) =>
            PleromaApiWebSocketsEventType.filtersChangedValue,
        announcement: (_) => PleromaApiWebSocketsEventType.announcementValue,
        conversation: (_) => PleromaApiWebSocketsEventType.conversationValue,
        chatUpdate: (_) => PleromaApiWebSocketsEventType.pleromaChatUpdateValue,
        followRelationshipsUpdate: (_) =>
            PleromaApiWebSocketsEventType.pleromaFollowRelationshipsUpdateValue,
        unknown: (value) => PleromaApiWebSocketsEventType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiWebSocketsEventTypeUnifediExtension
    on PleromaApiWebSocketsEventType {
  UnifediApiWebSocketsEventType toUnifediApiWebSocketsEventType() =>
      _converter.convertFrom(this);
}

extension UnifediApiWebSocketsEventTypePleromaExtension
    on UnifediApiWebSocketsEventType {
  PleromaApiWebSocketsEventType toPleromaApiWebSocketsEventType() =>
      _converter.convertTo(this);
}
