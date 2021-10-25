import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';

part 'pleroma_api_notification_type_sealed.freezed.dart';

@freezed
class PleromaApiNotificationType
    with _$PleromaApiNotificationType
    implements IPleromaApiUnion {
  static const followStringValue =
      MastodonApiNotificationType.followStringValue;
  static const favouriteStringValue =
      MastodonApiNotificationType.favouriteStringValue;
  static const reblogStringValue =
      MastodonApiNotificationType.reblogStringValue;
  static const mentionStringValue =
      MastodonApiNotificationType.mentionStringValue;
  static const pollStringValue = MastodonApiNotificationType.pollStringValue;
  static const moveStringValue = MastodonApiNotificationType.moveStringValue;
  static const followRequestStringValue =
      MastodonApiNotificationType.followRequestStringValue;
  static const pleromaEmojiReactionStringValue = 'pleroma:emoji_reaction';
  static const pleromaChatMentionStringValue = 'pleroma:chat_mention';
  static const pleromaReportStringValue = 'pleroma:report';

  static const followValue = PleromaApiNotificationType.follow();
  static const favouriteValue = PleromaApiNotificationType.favourite();
  static const reblogValue = PleromaApiNotificationType.reblog();
  static const mentionValue = PleromaApiNotificationType.mention();
  static const pollValue = PleromaApiNotificationType.poll();
  static const moveValue = PleromaApiNotificationType.move();
  static const followRequestValue = PleromaApiNotificationType.followRequest();
  static const pleromaEmojiReactionValue =
      PleromaApiNotificationType.pleromaEmojiReaction();
  static const pleromaChatMentionValue =
      PleromaApiNotificationType.pleromaChatMention();
  static const pleromaReportValue = PleromaApiNotificationType.pleromaReport();

  static const values = [
    followValue,
    favouriteValue,
    reblogValue,
    mentionValue,
    pollValue,
    moveValue,
    followRequestValue,
    pleromaEmojiReactionValue,
    pleromaChatMentionValue,
    pleromaReportValue,
  ];

  const factory PleromaApiNotificationType.follow({
    @Default(PleromaApiNotificationType.followStringValue) String stringValue,
  }) = _Follow;

  const factory PleromaApiNotificationType.favourite({
    @Default(PleromaApiNotificationType.favouriteStringValue)
        String stringValue,
  }) = _Favourite;

  const factory PleromaApiNotificationType.reblog({
    @Default(PleromaApiNotificationType.reblogStringValue) String stringValue,
  }) = _Reblog;

  const factory PleromaApiNotificationType.mention({
    @Default(PleromaApiNotificationType.mentionStringValue) String stringValue,
  }) = _Mention;

  const factory PleromaApiNotificationType.poll({
    @Default(PleromaApiNotificationType.pollStringValue) String stringValue,
  }) = _Poll;

  const factory PleromaApiNotificationType.move({
    @Default(PleromaApiNotificationType.moveStringValue) String stringValue,
  }) = _Move;

  const factory PleromaApiNotificationType.followRequest({
    @Default(PleromaApiNotificationType.followRequestStringValue)
        String stringValue,
  }) = _followRequest;

  const factory PleromaApiNotificationType.pleromaEmojiReaction({
    @Default(PleromaApiNotificationType.pleromaEmojiReactionStringValue)
        String stringValue,
  }) = _PleromaEmojiReaction;

  const factory PleromaApiNotificationType.pleromaChatMention({
    @Default(PleromaApiNotificationType.pleromaChatMentionStringValue)
        String stringValue,
  }) = _PleromaChatMention;

  const factory PleromaApiNotificationType.pleromaReport({
    @Default(PleromaApiNotificationType.pleromaReportStringValue)
        String stringValue,
  }) = _PleromaReport;

  const factory PleromaApiNotificationType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiNotificationType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            PleromaApiNotificationType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiNotificationTypeStringExtension on String {
  PleromaApiNotificationType toPleromaApiNotificationType() =>
      PleromaApiNotificationType.fromStringValue(this);
}

extension PleromaApiNotificationTypeStringListExtension on List<String> {
  List<PleromaApiNotificationType> toPleromaApiNotificationTypeList() =>
      map((stringValue) => stringValue.toPleromaApiNotificationType()).toList();
}

extension PleromaApiNotificationTypeExcludeFromListExtension
    on List<PleromaApiNotificationType> {
  List<PleromaApiNotificationType> valuesWithoutSelected(
    List<PleromaApiNotificationType> valuesToExclude,
  ) =>
      where(
        (value) => !valuesToExclude.contains(
          value,
        ),
      ).toList();
}
