import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../pleroma_api_model.dart';

part 'pleroma_api_rest_error_type_sealed.freezed.dart';

@freezed
class PleromaApiRestErrorType
    with _$PleromaApiRestErrorType
    implements IPleromaApiUnion {
  // You have been registered. Please check your email for further instructions.
  static const missingConfirmedEmailStringValue = 'missing_confirmed_email';
  // You have been registered. You'll be able to log in once your account is approved.
  static const awaitingApprovalStringValue = 'awaiting_approval';

  static const missingConfirmedEmailValue =
      PleromaApiRestErrorType.missingConfirmedEmail();
  static const awaitingApprovalValue =
      PleromaApiRestErrorType.awaitingApproval();

  static const values = [
    missingConfirmedEmailValue,
    awaitingApprovalValue,
  ];

  const factory PleromaApiRestErrorType.missingConfirmedEmail({
    @Default(PleromaApiRestErrorType.missingConfirmedEmailStringValue)
        String stringValue,
  }) = _MissingConfirmedEmail;

  const factory PleromaApiRestErrorType.awaitingApproval({
    @Default(PleromaApiRestErrorType.awaitingApprovalStringValue)
        String stringValue,
  }) = _AwaitingApproval;

  const factory PleromaApiRestErrorType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiRestErrorType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => PleromaApiRestErrorType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiRestErrorTypeStringExtension on String {
  PleromaApiRestErrorType toPleromaApiRestErrorType() =>
      PleromaApiRestErrorType.fromStringValue(this);
}

extension PleromaApiRestErrorTypeStringListExtension on List<String> {
  List<PleromaApiRestErrorType> toPleromaApiRestErrorTypeList() =>
      map((stringValue) => stringValue.toPleromaApiRestErrorType()).toList();
}
