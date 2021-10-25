import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mastodon_api_model.dart';

part 'mastodon_api_card_replies_policy_type_sealed.freezed.dart';

@freezed
class MastodonApiListRepliesPolicyType
    with _$MastodonApiListRepliesPolicyType
    implements IMastodonApiUnion {
  static const followedStringValue = 'followed';
  static const listStringValue = 'list';
  static const noneStringValue = 'none';

  static const followedValue = MastodonApiListRepliesPolicyType.followed();
  static const listValue = MastodonApiListRepliesPolicyType.list();
  static const noneValue = MastodonApiListRepliesPolicyType.none();

  static const values = [
    followedValue,
    listValue,
    noneValue,
  ];

  const factory MastodonApiListRepliesPolicyType.followed({
    @Default(MastodonApiListRepliesPolicyType.followedStringValue)
        String stringValue,
  }) = _Followed;

  const factory MastodonApiListRepliesPolicyType.list({
    @Default(MastodonApiListRepliesPolicyType.listStringValue)
        String stringValue,
  }) = _List;

  const factory MastodonApiListRepliesPolicyType.none({
    @Default(MastodonApiListRepliesPolicyType.noneStringValue)
        String stringValue,
  }) = _None;

  const factory MastodonApiListRepliesPolicyType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiListRepliesPolicyType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            MastodonApiListRepliesPolicyType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiListRepliesPolicyTypeStringExtension on String {
  MastodonApiListRepliesPolicyType toMastodonApiListRepliesPolicyType() =>
      MastodonApiListRepliesPolicyType.fromStringValue(this);
}

extension MastodonApiListRepliesPolicyTypeStringListExtension on List<String> {
  List<MastodonApiListRepliesPolicyType>
      toMastodonApiListRepliesPolicyTypeList() =>
          map((stringValue) => stringValue.toMastodonApiListRepliesPolicyType())
              .toList();
}
