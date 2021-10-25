import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/rest/error/type/unifedi_api_rest_error_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiRestErrorTypePleromaConverter();

class UnifediApiRestErrorTypePleromaConverter
    implements
        SealedConverter<UnifediApiRestErrorType, PleromaApiRestErrorType> {
  const UnifediApiRestErrorTypePleromaConverter();

  @override
  UnifediApiRestErrorType convertFrom(
    PleromaApiRestErrorType item,
  ) =>
      item.map(
        missingConfirmedEmail: (_) =>
            UnifediApiRestErrorType.missingConfirmedEmailValue,
        awaitingApproval: (_) => UnifediApiRestErrorType.awaitingApprovalValue,
        unknown: (value) => UnifediApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiRestErrorType convertTo(
    UnifediApiRestErrorType item,
  ) =>
      item.map(
        // ignore: no-equal-arguments
        invalidGrant: (value) => PleromaApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        accessTokenRevoked: (value) => PleromaApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        tooShort: (value) => PleromaApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        notIncluded: (value) => PleromaApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        unreachable: (value) => PleromaApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        unknown: (value) => PleromaApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),

        missingConfirmedEmail: (value) =>
            PleromaApiRestErrorType.missingConfirmedEmailValue,

        awaitingApproval: (value) =>
            PleromaApiRestErrorType.awaitingApprovalValue,
      );
}

extension PleromaApiRestErrorTypeUnifediExtension on PleromaApiRestErrorType {
  UnifediApiRestErrorType toUnifediApiRestErrorType() =>
      _converter.convertFrom(this);
}

extension UnifediApiRestErrorTypePleromaExtension on UnifediApiRestErrorType {
  PleromaApiRestErrorType toPleromaApiRestErrorType() =>
      _converter.convertTo(this);
}
