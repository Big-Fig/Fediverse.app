import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../mastodon_api_model.dart';

part 'mastodon_api_search_request_type_sealed.freezed.dart';

@freezed
class MastodonApiSearchRequestType
    with _$MastodonApiSearchRequestType
    implements IMastodonApiUnion {
  static const accountsStringValue = 'accounts';
  static const hashtagsStringValue = 'hashtags';
  static const statusesStringValue = 'statuses';

  static const accountsValue = MastodonApiSearchRequestType.accounts();
  static const hashtagsValue = MastodonApiSearchRequestType.hashtags();
  static const statusesValue = MastodonApiSearchRequestType.statuses();

  static const values = [
    accountsValue,
    hashtagsValue,
    hashtagsValue,
  ];

  const factory MastodonApiSearchRequestType.accounts({
    @Default(MastodonApiSearchRequestType.accountsStringValue)
        String stringValue,
  }) = _Accounts;

  const factory MastodonApiSearchRequestType.hashtags({
    @Default(MastodonApiSearchRequestType.hashtagsStringValue)
        String stringValue,
  }) = _Hashtags;

  const factory MastodonApiSearchRequestType.statuses({
    @Default(MastodonApiSearchRequestType.statusesStringValue)
        String stringValue,
  }) = _Statuses;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiSearchRequestType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension MastodonApiSearchRequestTypeStringExtension on String {
  MastodonApiSearchRequestType toMastodonApiSearchRequestType() =>
      MastodonApiSearchRequestType.fromStringValue(this);
}

extension MastodonApiSearchRequestTypeStringListExtension on List<String> {
  List<MastodonApiSearchRequestType> toMastodonApiSearchRequestTypeList() =>
      map((stringValue) => stringValue.toMastodonApiSearchRequestType())
          .toList();
}
