import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../unifedi_api_model.dart';

part 'unifedi_api_web_sockets_event_type_sealed.freezed.dart';

@freezed
class UnifediApiWebSocketsEventType
    with _$UnifediApiWebSocketsEventType
    implements IUnifediApiUnion {
  static const updateStringValue =
      PleromaApiWebSocketsEventType.updateStringValue;
  static const notificationStringValue =
      PleromaApiWebSocketsEventType.notificationStringValue;
  static const deleteStringValue =
      PleromaApiWebSocketsEventType.deleteStringValue;
  static const filtersChangedStringValue =
      PleromaApiWebSocketsEventType.filtersChangedStringValue;
  static const announcementStringValue =
      PleromaApiWebSocketsEventType.announcementStringValue;
  static const conversationStringValue =
      PleromaApiWebSocketsEventType.conversationStringValue;
  static const chatUpdateStringValue =
      PleromaApiWebSocketsEventType.pleromaChatUpdateStringValue;
  static const followRelationshipsUpdateStringValue =
      PleromaApiWebSocketsEventType.pleromaFollowRelationshipsUpdateStringValue;

  static const updateValue = UnifediApiWebSocketsEventType.update();
  static const notificationValue = UnifediApiWebSocketsEventType.notification();
  static const deleteValue = UnifediApiWebSocketsEventType.delete();
  static const filtersChangedValue =
      UnifediApiWebSocketsEventType.filtersChanged();
  static const announcementValue = UnifediApiWebSocketsEventType.announcement();
  static const conversationValue = UnifediApiWebSocketsEventType.conversation();
  static const chatUpdateValue = UnifediApiWebSocketsEventType.chatUpdate();
  static const followRelationshipsUpdateValue =
      UnifediApiWebSocketsEventType.followRelationshipsUpdate();

  static const values = [
    updateValue,
    notificationValue,
    deleteValue,
    filtersChangedValue,
    announcementValue,
    conversationValue,
    chatUpdateValue,
    followRelationshipsUpdateValue,
  ];

  const factory UnifediApiWebSocketsEventType.update({
    @Default(UnifediApiWebSocketsEventType.updateStringValue)
        String stringValue,
  }) = _Update;

  const factory UnifediApiWebSocketsEventType.notification({
    @Default(UnifediApiWebSocketsEventType.notificationStringValue)
        String stringValue,
  }) = _Notification;

  const factory UnifediApiWebSocketsEventType.delete({
    @Default(UnifediApiWebSocketsEventType.deleteStringValue)
        String stringValue,
  }) = _Delete;

  const factory UnifediApiWebSocketsEventType.filtersChanged({
    @Default(UnifediApiWebSocketsEventType.filtersChangedStringValue)
        String stringValue,
  }) = _FiltersChanged;

  const factory UnifediApiWebSocketsEventType.announcement({
    @Default(UnifediApiWebSocketsEventType.announcementStringValue)
        String stringValue,
  }) = _Announcement;
  const factory UnifediApiWebSocketsEventType.conversation({
    @Default(UnifediApiWebSocketsEventType.conversationStringValue)
        String stringValue,
  }) = _Conversation;

  const factory UnifediApiWebSocketsEventType.chatUpdate({
    @Default(UnifediApiWebSocketsEventType.chatUpdateStringValue)
        String stringValue,
  }) = _ChatUpdate;

  const factory UnifediApiWebSocketsEventType.followRelationshipsUpdate({
    @Default(UnifediApiWebSocketsEventType.followRelationshipsUpdateStringValue)
        String stringValue,
  }) = _FollowRelationshipsUpdate;

  const factory UnifediApiWebSocketsEventType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiWebSocketsEventType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            UnifediApiWebSocketsEventType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiWebSocketsEventTypeStringExtension on String {
  UnifediApiWebSocketsEventType toUnifediApiWebSocketsEventType() =>
      UnifediApiWebSocketsEventType.fromStringValue(this);
}

extension UnifediApiWebSocketsEventTypeStringListExtension on List<String> {
  List<UnifediApiWebSocketsEventType> toUnifediApiWebSocketsEventTypeList() =>
      map((stringValue) => stringValue.toUnifediApiWebSocketsEventType())
          .toList();
}

extension UnifediApiWebSocketsEventTypeUnifediExtension
    on UnifediApiWebSocketsEventType {
  UnifediApiWebSocketsEventType toUnifediApiWebSocketsEventType() =>
      UnifediApiWebSocketsEventType.fromStringValue(stringValue);
}

extension UnifediApiWebSocketsEventTypeStringUnifediExtension
    on List<UnifediApiWebSocketsEventType> {
  List<UnifediApiWebSocketsEventType> toUnifediApiWebSocketsEventTypeList() =>
      map((stringValue) => stringValue.toUnifediApiWebSocketsEventType())
          .toList();
}
