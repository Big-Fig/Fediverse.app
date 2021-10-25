import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/web_sockets/event/type/unifedi_api_web_sockets_event_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiWebSocketsEventTypeMastodonConverter();

class UnifediApiWebSocketsEventTypeMastodonConverter
    implements
        SealedConverter<UnifediApiWebSocketsEventType,
            MastodonApiWebSocketsEventType> {
  const UnifediApiWebSocketsEventTypeMastodonConverter();

  @override
  UnifediApiWebSocketsEventType convertFrom(
    MastodonApiWebSocketsEventType item,
  ) =>
      item.map(
        update: (_) => UnifediApiWebSocketsEventType.updateValue,
        notification: (_) => UnifediApiWebSocketsEventType.notificationValue,
        delete: (_) => UnifediApiWebSocketsEventType.deleteValue,
        filtersChanged: (_) =>
            UnifediApiWebSocketsEventType.filtersChangedValue,
        announcement: (_) => UnifediApiWebSocketsEventType.announcementValue,
        conversation: (_) => UnifediApiWebSocketsEventType.conversationValue,
        unknown: (value) => UnifediApiWebSocketsEventType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiWebSocketsEventType convertTo(
    UnifediApiWebSocketsEventType item,
  ) =>
      item.map(
        update: (_) => MastodonApiWebSocketsEventType.updateValue,
        notification: (_) => MastodonApiWebSocketsEventType.notificationValue,
        delete: (_) => MastodonApiWebSocketsEventType.deleteValue,
        filtersChanged: (_) =>
            MastodonApiWebSocketsEventType.filtersChangedValue,
        announcement: (_) => MastodonApiWebSocketsEventType.announcementValue,
        conversation: (_) => MastodonApiWebSocketsEventType.conversationValue,
        // ignore: no-equal-arguments
        chatUpdate: (value) => MastodonApiWebSocketsEventType.unknown(
          stringValue: value.stringValue,
        ), // ignore: no-equal-arguments
        followRelationshipsUpdate: (value) =>
            MastodonApiWebSocketsEventType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        unknown: (value) => MastodonApiWebSocketsEventType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiWebSocketsEventTypeUnifediExtension
    on MastodonApiWebSocketsEventType {
  UnifediApiWebSocketsEventType toUnifediApiWebSocketsEventType() =>
      _converter.convertFrom(this);
}

extension UnifediApiWebSocketsEventTypeMastodonExtension
    on UnifediApiWebSocketsEventType {
  MastodonApiWebSocketsEventType toMastodonApiWebSocketsEventType() =>
      _converter.convertTo(this);
}
