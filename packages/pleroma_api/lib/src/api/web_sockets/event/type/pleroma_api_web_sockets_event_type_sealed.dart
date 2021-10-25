import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../pleroma_api_model.dart';

part 'pleroma_api_web_sockets_event_type_sealed.freezed.dart';

@freezed
class PleromaApiWebSocketsEventType
    with _$PleromaApiWebSocketsEventType
    implements IPleromaApiUnion {
  static const updateStringValue =
      MastodonApiWebSocketsEventType.updateStringValue;
  static const notificationStringValue =
      MastodonApiWebSocketsEventType.notificationStringValue;
  static const deleteStringValue =
      MastodonApiWebSocketsEventType.deleteStringValue;
  static const filtersChangedStringValue =
      MastodonApiWebSocketsEventType.filtersChangedStringValue;
  static const announcementStringValue =
      MastodonApiWebSocketsEventType.announcementStringValue;
  static const conversationStringValue =
      MastodonApiWebSocketsEventType.conversationStringValue;
  static const pleromaChatUpdateStringValue = 'pleroma:chat_update';
  static const pleromaFollowRelationshipsUpdateStringValue =
      'pleroma:follow_relationships_update';

  static const updateValue = PleromaApiWebSocketsEventType.update();
  static const notificationValue = PleromaApiWebSocketsEventType.notification();
  static const deleteValue = PleromaApiWebSocketsEventType.delete();
  static const filtersChangedValue =
      PleromaApiWebSocketsEventType.filtersChanged();
  static const announcementValue = PleromaApiWebSocketsEventType.announcement();
  static const conversationValue = PleromaApiWebSocketsEventType.conversation();
  static const pleromaChatUpdateValue =
      PleromaApiWebSocketsEventType.pleromaChatUpdate();
  static const pleromaFollowRelationshipsUpdateValue =
      PleromaApiWebSocketsEventType.pleromaFollowRelationshipsUpdate();

  static const values = [
    updateValue,
    notificationValue,
    deleteValue,
    filtersChangedValue,
    announcementValue,
    conversationValue,
    pleromaChatUpdateValue,
    pleromaFollowRelationshipsUpdateValue,
  ];

  const factory PleromaApiWebSocketsEventType.update({
    @Default(PleromaApiWebSocketsEventType.updateStringValue)
        String stringValue,
  }) = _Update;

  const factory PleromaApiWebSocketsEventType.notification({
    @Default(PleromaApiWebSocketsEventType.notificationStringValue)
        String stringValue,
  }) = _Notification;

  const factory PleromaApiWebSocketsEventType.delete({
    @Default(PleromaApiWebSocketsEventType.deleteStringValue)
        String stringValue,
  }) = _Delete;

  const factory PleromaApiWebSocketsEventType.filtersChanged({
    @Default(PleromaApiWebSocketsEventType.filtersChangedStringValue)
        String stringValue,
  }) = _FiltersChanged;

  const factory PleromaApiWebSocketsEventType.announcement({
    @Default(PleromaApiWebSocketsEventType.announcementStringValue)
        String stringValue,
  }) = _Announcement;

  const factory PleromaApiWebSocketsEventType.conversation({
    @Default(PleromaApiWebSocketsEventType.conversationStringValue)
        String stringValue,
  }) = _Conversation;

  const factory PleromaApiWebSocketsEventType.pleromaChatUpdate({
    @Default(PleromaApiWebSocketsEventType.pleromaChatUpdateStringValue)
        String stringValue,
  }) = _PleromaChatUpdate;

  const factory PleromaApiWebSocketsEventType.pleromaFollowRelationshipsUpdate({
    @Default(
      PleromaApiWebSocketsEventType.pleromaFollowRelationshipsUpdateStringValue,
    )
        String stringValue,
  }) = _PleromaFollowRelationshipsUpdate;

  const factory PleromaApiWebSocketsEventType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiWebSocketsEventType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            PleromaApiWebSocketsEventType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiWebSocketsEventTypeStringExtension on String {
  PleromaApiWebSocketsEventType toPleromaApiWebSocketsEventType() =>
      PleromaApiWebSocketsEventType.fromStringValue(this);
}

extension PleromaApiWebSocketsEventTypeStringListExtension on List<String> {
  List<PleromaApiWebSocketsEventType> toPleromaApiWebSocketsEventTypeList() =>
      map((stringValue) => stringValue.toPleromaApiWebSocketsEventType())
          .toList();
}
