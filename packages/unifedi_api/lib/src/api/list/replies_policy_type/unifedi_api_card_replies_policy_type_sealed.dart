import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../unifedi_api_model.dart';

part 'unifedi_api_card_replies_policy_type_sealed.freezed.dart';

@freezed
class UnifediApiListRepliesPolicyType
    with _$UnifediApiListRepliesPolicyType
    implements IUnifediApiUnion {
  static const followedStringValue =
      PleromaApiListRepliesPolicyType.followedStringValue;
  static const listStringValue =
      PleromaApiListRepliesPolicyType.listStringValue;
  static const noneStringValue =
      PleromaApiListRepliesPolicyType.noneStringValue;

  static const followedValue = UnifediApiListRepliesPolicyType.followed();
  static const listValue = UnifediApiListRepliesPolicyType.list();
  static const noneValue = UnifediApiListRepliesPolicyType.none();

  static const values = [
    followedValue,
    listValue,
    noneValue,
  ];

  const factory UnifediApiListRepliesPolicyType.followed({
    @Default(UnifediApiListRepliesPolicyType.followedStringValue)
        String stringValue,
  }) = _Followed;

  const factory UnifediApiListRepliesPolicyType.list({
    @Default(UnifediApiListRepliesPolicyType.listStringValue)
        String stringValue,
  }) = _List;

  const factory UnifediApiListRepliesPolicyType.none({
    @Default(UnifediApiListRepliesPolicyType.noneStringValue)
        String stringValue,
  }) = _None;

  const factory UnifediApiListRepliesPolicyType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiListRepliesPolicyType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            UnifediApiListRepliesPolicyType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiListRepliesPolicyTypeStringExtension on String {
  UnifediApiListRepliesPolicyType toUnifediApiListRepliesPolicyType() =>
      UnifediApiListRepliesPolicyType.fromStringValue(this);
}

extension UnifediApiListRepliesPolicyTypeStringListExtension on List<String> {
  List<UnifediApiListRepliesPolicyType>
      toUnifediApiListRepliesPolicyTypeList() =>
          map((stringValue) => stringValue.toUnifediApiListRepliesPolicyType())
              .toList();
}

extension UnifediApiListRepliesPolicyTypeMastodonExtension
    on UnifediApiListRepliesPolicyType {
  MastodonApiListRepliesPolicyType toMastodonApiListRepliesPolicyType() =>
      MastodonApiListRepliesPolicyType.fromStringValue(stringValue);
}

extension UnifediApiListRepliesPolicyTypePleromaExtension
    on UnifediApiListRepliesPolicyType {
  PleromaApiListRepliesPolicyType toPleromaApiListRepliesPolicyType() =>
      PleromaApiListRepliesPolicyType.fromStringValue(stringValue);
}
