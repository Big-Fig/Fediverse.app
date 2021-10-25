import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';

part 'pleroma_api_card_replies_policy_type_sealed.freezed.dart';

@freezed
class PleromaApiListRepliesPolicyType
    with _$PleromaApiListRepliesPolicyType
    implements IPleromaApiUnion {
  static const followedStringValue =
      MastodonApiListRepliesPolicyType.followedStringValue;
  static const listStringValue =
      MastodonApiListRepliesPolicyType.listStringValue;
  static const noneStringValue =
      MastodonApiListRepliesPolicyType.noneStringValue;

  static const followedValue = PleromaApiListRepliesPolicyType.followed();
  static const listValue = PleromaApiListRepliesPolicyType.list();
  static const noneValue = PleromaApiListRepliesPolicyType.none();

  static const values = [
    followedValue,
    listValue,
    noneValue,
  ];

  const factory PleromaApiListRepliesPolicyType.followed({
    @Default(PleromaApiListRepliesPolicyType.followedStringValue)
        String stringValue,
  }) = _Followed;

  const factory PleromaApiListRepliesPolicyType.list({
    @Default(PleromaApiListRepliesPolicyType.listStringValue)
        String stringValue,
  }) = _List;

  const factory PleromaApiListRepliesPolicyType.none({
    @Default(PleromaApiListRepliesPolicyType.noneStringValue)
        String stringValue,
  }) = _None;

  const factory PleromaApiListRepliesPolicyType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiListRepliesPolicyType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            PleromaApiListRepliesPolicyType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiListRepliesPolicyTypeStringExtension on String {
  PleromaApiListRepliesPolicyType toPleromaApiListRepliesPolicyType() =>
      PleromaApiListRepliesPolicyType.fromStringValue(this);
}

extension PleromaApiListRepliesPolicyTypeStringListExtension on List<String> {
  List<PleromaApiListRepliesPolicyType>
      toPleromaApiListRepliesPolicyTypeList() =>
          map((stringValue) => stringValue.toPleromaApiListRepliesPolicyType())
              .toList();
}

extension PleromaApiListRepliesPolicyTypeMastodonExtension
    on PleromaApiListRepliesPolicyType {
  MastodonApiListRepliesPolicyType toMastodonApiListRepliesPolicyType() =>
      MastodonApiListRepliesPolicyType.fromStringValue(stringValue);
}
