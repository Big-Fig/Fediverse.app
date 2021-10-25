import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../unifedi_api_model.dart';

part 'unifedi_api_rest_error_type_sealed.freezed.dart';

@freezed
class UnifediApiRestErrorType
    with _$UnifediApiRestErrorType
    implements IUnifediApiUnion {
  // You have been registered. Please check your email for further instructions.
  static const missingConfirmedEmailStringValue = 'missing_confirmed_email';
  // You have been registered. You'll be able to log in once your account is approved.
  static const awaitingApprovalStringValue = 'awaiting_approval';

  static const invalidGrantStringValue = 'invalid_grant';
  static const accessTokenRevokedStringValue = 'The access token was revoked';

  // is too short (minimum is 8 characters)
  static const tooShortStringValue = 'ERR_TOO_SHORT';

  // locale is not included in the list
  static const notIncludedStringValue = 'ERR_INCLUSION';

  //does not seem to exist
  static const unreachableStringValue = 'ERR_UNREACHABLE';

  static const invalidGrantValue = UnifediApiRestErrorType.invalidGrant();
  static const accessTokenRevokedValue =
      UnifediApiRestErrorType.accessTokenRevoked();
  static const tooShortValue = UnifediApiRestErrorType.tooShort();
  static const notIncludedValue = UnifediApiRestErrorType.notIncluded();
  static const unreachableValue = UnifediApiRestErrorType.unreachable();

  static const missingConfirmedEmailValue =
      UnifediApiRestErrorType.missingConfirmedEmail();
  static const awaitingApprovalValue =
      UnifediApiRestErrorType.awaitingApproval();

  static const values = [
    invalidGrantValue,
    accessTokenRevokedValue,
    tooShortValue,
    notIncludedValue,
    unreachableValue,
    missingConfirmedEmailValue,
    awaitingApprovalValue,
  ];

  const factory UnifediApiRestErrorType.missingConfirmedEmail({
    @Default(UnifediApiRestErrorType.missingConfirmedEmailStringValue)
        String stringValue,
  }) = _MissingConfirmedEmail;

  const factory UnifediApiRestErrorType.awaitingApproval({
    @Default(UnifediApiRestErrorType.awaitingApprovalStringValue)
        String stringValue,
  }) = _AwaitingApproval;

  const factory UnifediApiRestErrorType.invalidGrant({
    @Default(UnifediApiRestErrorType.invalidGrantStringValue)
        String stringValue,
  }) = _InvalidGrant;

  const factory UnifediApiRestErrorType.accessTokenRevoked({
    @Default(UnifediApiRestErrorType.accessTokenRevokedStringValue)
        String stringValue,
  }) = _AccessTokenRevoked;

  const factory UnifediApiRestErrorType.tooShort({
    @Default(UnifediApiRestErrorType.tooShortStringValue) String stringValue,
  }) = _TooShort;

  const factory UnifediApiRestErrorType.notIncluded({
    @Default(UnifediApiRestErrorType.notIncludedStringValue) String stringValue,
  }) = _NotIncluded;

  const factory UnifediApiRestErrorType.unreachable({
    @Default(UnifediApiRestErrorType.unreachableStringValue) String stringValue,
  }) = _Unreachable;

  const factory UnifediApiRestErrorType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiRestErrorType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => UnifediApiRestErrorType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiRestErrorTypeStringExtension on String {
  UnifediApiRestErrorType toUnifediApiRestErrorType() =>
      UnifediApiRestErrorType.fromStringValue(this);
}

extension UnifediApiRestErrorTypeStringListExtension on List<String> {
  List<UnifediApiRestErrorType> toUnifediApiRestErrorTypeList() =>
      map((stringValue) => stringValue.toUnifediApiRestErrorType()).toList();
}
