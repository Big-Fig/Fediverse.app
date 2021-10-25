import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../mastodon_api_model.dart';

part 'mastodon_api_access_level_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class MastodonApiAccessLevelType
    with _$MastodonApiAccessLevelType
    implements IMastodonApiUnion {
  static const publicLevelIntValue =
      FediverseApiAccessLevelType.publicLevelIntValue;
  static const applicationLevelIntValue =
      FediverseApiAccessLevelType.applicationLevelIntValue;
  static const userLevelIntValue =
      FediverseApiAccessLevelType.userLevelIntValue;

  static const publicLevelStringValue =
      FediverseApiAccessLevelType.publicLevelStringValue;
  static const applicationLevelStringValue =
      FediverseApiAccessLevelType.applicationLevelStringValue;
  static const userLevelStringValue =
      FediverseApiAccessLevelType.userLevelStringValue;

  static const publicValue = MastodonApiAccessLevelType.public();
  static const applicationValue = MastodonApiAccessLevelType.application();
  static const userValue = MastodonApiAccessLevelType.user();

  static const values = [
    publicValue,
    applicationValue,
    userValue,
  ];

  const factory MastodonApiAccessLevelType.public({
    @Default(MastodonApiAccessLevelType.publicLevelIntValue) int level,
    @Default(MastodonApiAccessLevelType.publicLevelStringValue)
        String stringValue,
  }) = _Public;

  const factory MastodonApiAccessLevelType.application({
    @Default(MastodonApiAccessLevelType.applicationLevelIntValue) int level,
    @Default(MastodonApiAccessLevelType.applicationLevelStringValue)
        String stringValue,
  }) = _Application;

  const factory MastodonApiAccessLevelType.user({
    @Default(MastodonApiAccessLevelType.userLevelIntValue) int level,
    @Default(MastodonApiAccessLevelType.userLevelStringValue)
        String stringValue,
  }) = _Valid;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiAccessLevelType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension MastodonApiAccessLevelTypeStringExtension on String {
  MastodonApiAccessLevelType toMastodonApiAccessLevelType() =>
      MastodonApiAccessLevelType.fromStringValue(this);
}
