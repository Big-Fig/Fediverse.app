import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';

part 'pleroma_api_search_request_type_sealed.freezed.dart';

@freezed
class PleromaApiSearchRequestType
    with _$PleromaApiSearchRequestType
    implements IPleromaApiUnion {
  static const accountsStringValue =
      MastodonApiSearchRequestType.accountsStringValue;
  static const hashtagsStringValue =
      MastodonApiSearchRequestType.hashtagsStringValue;
  static const statusesStringValue =
      MastodonApiSearchRequestType.statusesStringValue;

  static const accountsValue = PleromaApiSearchRequestType.accounts();
  static const hashtagsValue = PleromaApiSearchRequestType.hashtags();
  static const statusesValue = PleromaApiSearchRequestType.statuses();

  static const values = [
    accountsValue,
    hashtagsValue,
    statusesValue,
  ];

  const factory PleromaApiSearchRequestType.accounts({
    @Default(PleromaApiSearchRequestType.accountsStringValue)
        String stringValue,
  }) = _Accounts;

  const factory PleromaApiSearchRequestType.hashtags({
    @Default(PleromaApiSearchRequestType.hashtagsStringValue)
        String stringValue,
  }) = _Hashtags;

  const factory PleromaApiSearchRequestType.statuses({
    @Default(PleromaApiSearchRequestType.statusesStringValue)
        String stringValue,
  }) = _Statuses;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiSearchRequestType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension PleromaApiSearchRequestTypeStringExtension on String {
  PleromaApiSearchRequestType toPleromaApiSearchRequestType() =>
      PleromaApiSearchRequestType.fromStringValue(this);
}

extension PleromaApiSearchRequestTypeStringListExtension on List<String> {
  List<PleromaApiSearchRequestType> toPleromaApiSearchRequestTypeList() =>
      map((stringValue) => stringValue.toPleromaApiSearchRequestType())
          .toList();
}

extension PleromaApiSearchRequestTypeMastodonExtension
    on PleromaApiSearchRequestType {
  MastodonApiSearchRequestType toMastodonApiSearchRequestType() =>
      MastodonApiSearchRequestType.fromStringValue(stringValue);
}

extension PleromaApiSearchRequestTypeStringMastodonExtension
    on List<PleromaApiSearchRequestType> {
  List<MastodonApiSearchRequestType> toMastodonApiSearchRequestTypeList() =>
      map((stringValue) => stringValue.toMastodonApiSearchRequestType())
          .toList();
}
