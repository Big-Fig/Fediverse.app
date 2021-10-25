import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../unifedi_api_model.dart';

part 'unifedi_api_notification_type_sealed.freezed.dart';

@freezed
class UnifediApiNotificationType
    with _$UnifediApiNotificationType
    implements IUnifediApiUnion {
  static const followStringValue = 'follow';
  static const favouriteStringValue = 'favourite';
  static const reblogStringValue = 'reblog';
  static const mentionStringValue = 'mention';
  static const pollStringValue = 'poll';
  static const moveStringValue = 'move';
  static const followRequestStringValue = 'follow_request';

  static const emojiReactionStringValue = 'emoji_reaction';
  static const chatMentionStringValue = 'chat_mention';
  static const reportStringValue = 'report';

  static const followValue = UnifediApiNotificationType.follow();
  static const favouriteValue = UnifediApiNotificationType.favourite();
  static const reblogValue = UnifediApiNotificationType.reblog();
  static const mentionValue = UnifediApiNotificationType.mention();
  static const pollValue = UnifediApiNotificationType.poll();
  static const moveValue = UnifediApiNotificationType.move();
  static const followRequestValue = UnifediApiNotificationType.followRequest();
  static const emojiReactionValue = UnifediApiNotificationType.emojiReaction();
  static const chatMentionValue = UnifediApiNotificationType.chatMention();
  static const reportValue = UnifediApiNotificationType.report();

  static const values = [
    followValue,
    favouriteValue,
    reblogValue,
    mentionValue,
    pollValue,
    moveValue,
    followRequestValue,
    emojiReactionValue,
    chatMentionValue,
    reportValue,
  ];

  const factory UnifediApiNotificationType.follow({
    @Default(UnifediApiNotificationType.followStringValue) String stringValue,
  }) = _Follow;

  const factory UnifediApiNotificationType.favourite({
    @Default(UnifediApiNotificationType.favouriteStringValue)
        String stringValue,
  }) = _Favourite;

  const factory UnifediApiNotificationType.reblog({
    @Default(UnifediApiNotificationType.reblogStringValue) String stringValue,
  }) = _Reblog;

  const factory UnifediApiNotificationType.mention({
    @Default(UnifediApiNotificationType.mentionStringValue) String stringValue,
  }) = _Mention;

  const factory UnifediApiNotificationType.poll({
    @Default(UnifediApiNotificationType.pollStringValue) String stringValue,
  }) = _Poll;

  const factory UnifediApiNotificationType.move({
    @Default(UnifediApiNotificationType.moveStringValue) String stringValue,
  }) = _Move;

  const factory UnifediApiNotificationType.followRequest({
    @Default(UnifediApiNotificationType.followRequestStringValue)
        String stringValue,
  }) = _followRequest;

  const factory UnifediApiNotificationType.emojiReaction({
    @Default(UnifediApiNotificationType.emojiReactionStringValue)
        String stringValue,
  }) = _EmojiReaction;

  const factory UnifediApiNotificationType.chatMention({
    @Default(UnifediApiNotificationType.chatMentionStringValue)
        String stringValue,
  }) = _ChatMention;

  const factory UnifediApiNotificationType.report({
    @Default(UnifediApiNotificationType.reportStringValue) String stringValue,
  }) = _Report;

  const factory UnifediApiNotificationType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiNotificationType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            UnifediApiNotificationType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiNotificationTypeStringExtension on String {
  UnifediApiNotificationType toUnifediApiNotificationType() =>
      UnifediApiNotificationType.fromStringValue(this);
}

extension UnifediApiNotificationTypeStringListExtension on List<String> {
  List<UnifediApiNotificationType> toUnifediApiNotificationTypeList() =>
      map((stringValue) => stringValue.toUnifediApiNotificationType()).toList();
}

extension UnifediApiNotificationTypeExcludeFromListExtension
    on List<UnifediApiNotificationType> {
  List<UnifediApiNotificationType> valuesWithoutSelected(
    List<UnifediApiNotificationType> valuesToExclude,
  ) =>
      where(
        (value) => !valuesToExclude.contains(
          value,
        ),
      ).toList();
}
