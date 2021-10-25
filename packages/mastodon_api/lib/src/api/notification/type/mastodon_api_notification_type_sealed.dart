import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../mastodon_api_model.dart';

part 'mastodon_api_notification_type_sealed.freezed.dart';

@freezed
class MastodonApiNotificationType
    with _$MastodonApiNotificationType
    implements IMastodonApiUnion {
  static const followStringValue = 'follow';
  static const favouriteStringValue = 'favourite';
  static const reblogStringValue = 'reblog';
  static const mentionStringValue = 'mention';
  static const pollStringValue = 'poll';
  static const moveStringValue = 'move';
  static const followRequestStringValue = 'follow_request';

  static const followValue = MastodonApiNotificationType.follow();
  static const favouriteValue = MastodonApiNotificationType.favourite();
  static const reblogValue = MastodonApiNotificationType.reblog();
  static const mentionValue = MastodonApiNotificationType.mention();
  static const pollValue = MastodonApiNotificationType.poll();
  static const moveValue = MastodonApiNotificationType.move();
  static const followRequestValue = MastodonApiNotificationType.followRequest();

  static const values = [
    followValue,
    favouriteValue,
    reblogValue,
    mentionValue,
    pollValue,
    moveValue,
    followRequestValue,
  ];

  const factory MastodonApiNotificationType.follow({
    @Default(MastodonApiNotificationType.followStringValue) String stringValue,
  }) = _Follow;

  const factory MastodonApiNotificationType.favourite({
    @Default(MastodonApiNotificationType.favouriteStringValue)
        String stringValue,
  }) = _Favourite;

  const factory MastodonApiNotificationType.reblog({
    @Default(MastodonApiNotificationType.reblogStringValue) String stringValue,
  }) = _Reblog;

  const factory MastodonApiNotificationType.mention({
    @Default(MastodonApiNotificationType.mentionStringValue) String stringValue,
  }) = _Mention;

  const factory MastodonApiNotificationType.poll({
    @Default(MastodonApiNotificationType.pollStringValue) String stringValue,
  }) = _Poll;

  const factory MastodonApiNotificationType.move({
    @Default(MastodonApiNotificationType.moveStringValue) String stringValue,
  }) = _Move;

  const factory MastodonApiNotificationType.followRequest({
    @Default(MastodonApiNotificationType.followRequestStringValue)
        String stringValue,
  }) = _followRequest;

  const factory MastodonApiNotificationType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiNotificationType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            MastodonApiNotificationType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiNotificationTypeStringExtension on String {
  MastodonApiNotificationType toMastodonApiNotificationType() =>
      MastodonApiNotificationType.fromStringValue(this);
}

extension MastodonApiNotificationTypeStringListExtension on List<String> {
  List<MastodonApiNotificationType> toMastodonApiNotificationTypeList() =>
      map((stringValue) => stringValue.toMastodonApiNotificationType())
          .toList();
}

extension MastodonApiNotificationTypeExcludeFromListExtension
    on List<MastodonApiNotificationType> {
  List<MastodonApiNotificationType> valuesWithoutSelected(
    List<MastodonApiNotificationType> valuesToExclude,
  ) =>
      where(
        (value) => !valuesToExclude.contains(
          value,
        ),
      ).toList();
}
