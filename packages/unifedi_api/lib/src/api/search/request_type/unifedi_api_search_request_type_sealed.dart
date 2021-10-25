import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../unifedi_api_model.dart';

part 'unifedi_api_search_request_type_sealed.freezed.dart';

@freezed
class UnifediApiSearchRequestType
    with _$UnifediApiSearchRequestType
    implements IUnifediApiUnion {
  static const accountsStringValue =
      MastodonApiSearchRequestType.accountsStringValue;
  static const hashtagsStringValue =
      MastodonApiSearchRequestType.hashtagsStringValue;
  static const statusesStringValue =
      MastodonApiSearchRequestType.statusesStringValue;

  static const accountsValue = UnifediApiSearchRequestType.accounts();
  static const hashtagsValue = UnifediApiSearchRequestType.hashtags();
  static const statusesValue = UnifediApiSearchRequestType.statuses();

  static const values = [
    accountsValue,
    hashtagsValue,
    statusesValue,
  ];

  const factory UnifediApiSearchRequestType.accounts({
    @Default(UnifediApiSearchRequestType.accountsStringValue)
        String stringValue,
  }) = _Accounts;

  const factory UnifediApiSearchRequestType.hashtags({
    @Default(UnifediApiSearchRequestType.hashtagsStringValue)
        String stringValue,
  }) = _Hashtags;

  const factory UnifediApiSearchRequestType.statuses({
    @Default(UnifediApiSearchRequestType.statusesStringValue)
        String stringValue,
  }) = _Statuses;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiSearchRequestType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension UnifediApiSearchRequestTypeStringExtension on String {
  UnifediApiSearchRequestType toUnifediApiSearchRequestType() =>
      UnifediApiSearchRequestType.fromStringValue(this);
}

extension UnifediApiSearchRequestTypeStringListExtension on List<String> {
  List<UnifediApiSearchRequestType> toUnifediApiSearchRequestTypeList() =>
      map((stringValue) => stringValue.toUnifediApiSearchRequestType())
          .toList();
}

extension UnifediApiSearchRequestTypeMastodonExtension
    on UnifediApiSearchRequestType {
  MastodonApiSearchRequestType toMastodonApiSearchRequestType() =>
      MastodonApiSearchRequestType.fromStringValue(stringValue);
}

extension UnifediApiSearchRequestTypeStringMastodonExtension
    on List<UnifediApiSearchRequestType> {
  List<MastodonApiSearchRequestType> toMastodonApiSearchRequestTypeList() =>
      map((stringValue) => stringValue.toMastodonApiSearchRequestType())
          .toList();
}
