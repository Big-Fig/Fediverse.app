import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../mastodon_api_model.dart';

part 'mastodon_api_web_sockets_event_type_sealed.freezed.dart';

@freezed
class MastodonApiWebSocketsEventType
    with _$MastodonApiWebSocketsEventType
    implements IMastodonApiUnion {
  static const updateStringValue = 'update';
  static const notificationStringValue = 'notification';
  static const deleteStringValue = 'delete';
  static const filtersChangedStringValue = 'filters_changed';
  static const announcementStringValue = 'announcement';
  static const conversationStringValue = 'conversation';

  static const updateValue = MastodonApiWebSocketsEventType.update();
  static const notificationValue =
      MastodonApiWebSocketsEventType.notification();
  static const deleteValue = MastodonApiWebSocketsEventType.delete();
  static const filtersChangedValue =
      MastodonApiWebSocketsEventType.filtersChanged();
  static const announcementValue =
      MastodonApiWebSocketsEventType.announcement();
  static const conversationValue =
      MastodonApiWebSocketsEventType.conversation();

  static const values = [
    updateValue,
    notificationValue,
    deleteValue,
    filtersChangedValue,
    announcementValue,
    conversationValue,
  ];

  const factory MastodonApiWebSocketsEventType.update({
    @Default(MastodonApiWebSocketsEventType.updateStringValue)
        String stringValue,
  }) = _Update;

  const factory MastodonApiWebSocketsEventType.notification({
    @Default(MastodonApiWebSocketsEventType.notificationStringValue)
        String stringValue,
  }) = _Notification;

  const factory MastodonApiWebSocketsEventType.delete({
    @Default(MastodonApiWebSocketsEventType.deleteStringValue)
        String stringValue,
  }) = _Delete;

  const factory MastodonApiWebSocketsEventType.filtersChanged({
    @Default(MastodonApiWebSocketsEventType.filtersChangedStringValue)
        String stringValue,
  }) = _FiltersChanged;

  const factory MastodonApiWebSocketsEventType.announcement({
    @Default(MastodonApiWebSocketsEventType.announcementStringValue)
        String stringValue,
  }) = _Announcement;
  const factory MastodonApiWebSocketsEventType.conversation({
    @Default(MastodonApiWebSocketsEventType.conversationStringValue)
        String stringValue,
  }) = _Conversation;

  const factory MastodonApiWebSocketsEventType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiWebSocketsEventType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            MastodonApiWebSocketsEventType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiWebSocketsEventTypeStringExtension on String {
  MastodonApiWebSocketsEventType toMastodonApiWebSocketsEventType() =>
      MastodonApiWebSocketsEventType.fromStringValue(this);
}

extension MastodonApiWebSocketsEventTypeStringListExtension on List<String> {
  List<MastodonApiWebSocketsEventType> toMastodonApiWebSocketsEventTypeList() =>
      map((stringValue) => stringValue.toMastodonApiWebSocketsEventType())
          .toList();
}
