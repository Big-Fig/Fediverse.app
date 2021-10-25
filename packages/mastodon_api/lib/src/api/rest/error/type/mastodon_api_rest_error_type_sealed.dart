import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../mastodon_api_model.dart';

part 'mastodon_api_rest_error_type_sealed.freezed.dart';

@freezed
class MastodonApiRestErrorType
    with _$MastodonApiRestErrorType
    implements IMastodonApiUnion {
  static const invalidGrantStringValue = 'invalid_grant';
  static const accessTokenRevokedStringValue = 'The access token was revoked';
  static const emailConfirmationRequiredStringValue =
      'Your login is missing a confirmed e-mail address';

  // is too short (minimum is 8 characters)
  static const tooShortStringValue = 'ERR_TOO_SHORT';

  // locale is not included in the list
  static const notIncludedStringValue = 'ERR_INCLUSION';

  //does not seem to exist
  static const unreachableStringValue = 'ERR_UNREACHABLE';

  static const invalidGrantValue = MastodonApiRestErrorType.invalidGrant();
  static const accessTokenRevokedValue =
      MastodonApiRestErrorType.accessTokenRevoked();
  static const emailConfirmationRequiredValue =
      MastodonApiRestErrorType.emailConfirmationRequired();
  static const tooShortValue = MastodonApiRestErrorType.tooShort();
  static const notIncludedValue = MastodonApiRestErrorType.notIncluded();
  static const unreachableValue = MastodonApiRestErrorType.unreachable();

  static const values = [
    invalidGrantValue,
    accessTokenRevokedValue,
    emailConfirmationRequiredValue,
    tooShortValue,
    notIncludedValue,
    unreachableValue,
  ];

  const factory MastodonApiRestErrorType.invalidGrant({
    @Default(MastodonApiRestErrorType.invalidGrantStringValue)
        String stringValue,
  }) = _InvalidGrant;

  const factory MastodonApiRestErrorType.accessTokenRevoked({
    @Default(MastodonApiRestErrorType.accessTokenRevokedStringValue)
        String stringValue,
  }) = _AccessTokenRevoked;

  const factory MastodonApiRestErrorType.emailConfirmationRequired({
    @Default(MastodonApiRestErrorType.emailConfirmationRequiredStringValue)
        String stringValue,
  }) = _EmailConfirmationRequired;

  const factory MastodonApiRestErrorType.tooShort({
    @Default(MastodonApiRestErrorType.tooShortStringValue) String stringValue,
  }) = _TooShort;

  const factory MastodonApiRestErrorType.notIncluded({
    @Default(MastodonApiRestErrorType.notIncludedStringValue)
        String stringValue,
  }) = _NotIncluded;

  const factory MastodonApiRestErrorType.unreachable({
    @Default(MastodonApiRestErrorType.unreachableStringValue)
        String stringValue,
  }) = _Unreachable;

  const factory MastodonApiRestErrorType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiRestErrorType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => MastodonApiRestErrorType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiRestErrorTypeStringExtension on String {
  MastodonApiRestErrorType toMastodonApiRestErrorType() =>
      MastodonApiRestErrorType.fromStringValue(this);
}

extension MastodonApiRestErrorTypeStringListExtension on List<String> {
  List<MastodonApiRestErrorType> toMastodonApiRestErrorTypeList() =>
      map((stringValue) => stringValue.toMastodonApiRestErrorType()).toList();
}
