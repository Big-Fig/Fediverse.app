import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/rest/error/type/unifedi_api_rest_error_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiRestErrorTypeMastodonConverter();

class UnifediApiRestErrorTypeMastodonConverter
    implements
        SealedConverter<UnifediApiRestErrorType, MastodonApiRestErrorType> {
  const UnifediApiRestErrorTypeMastodonConverter();

  @override
  UnifediApiRestErrorType convertFrom(
    MastodonApiRestErrorType item,
  ) =>
      item.map(
        invalidGrant: (_) => UnifediApiRestErrorType.invalidGrantValue,
        accessTokenRevoked: (_) =>
            UnifediApiRestErrorType.accessTokenRevokedValue,
        emailConfirmationRequired: (_) =>
            UnifediApiRestErrorType.missingConfirmedEmailValue,
        tooShort: (_) => UnifediApiRestErrorType.tooShortValue,
        notIncluded: (_) => UnifediApiRestErrorType.notIncludedValue,
        unreachable: (_) => UnifediApiRestErrorType.unreachableValue,
        unknown: (value) => UnifediApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiRestErrorType convertTo(
    UnifediApiRestErrorType item,
  ) =>
      item.map(
        invalidGrant: (_) => MastodonApiRestErrorType.invalidGrantValue,
        accessTokenRevoked: (_) =>
            MastodonApiRestErrorType.accessTokenRevokedValue,
        tooShort: (_) => MastodonApiRestErrorType.tooShortValue,
        notIncluded: (_) => MastodonApiRestErrorType.notIncludedValue,
        unreachable: (_) => MastodonApiRestErrorType.unreachableValue,
        unknown: (value) => MastodonApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        missingConfirmedEmail: (value) =>
            MastodonApiRestErrorType.emailConfirmationRequiredValue,
        // ignore: no-equal-arguments
        awaitingApproval: (value) => MastodonApiRestErrorType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiRestErrorTypeUnifediExtension on MastodonApiRestErrorType {
  UnifediApiRestErrorType toUnifediApiRestErrorType() =>
      _converter.convertFrom(this);
}

extension UnifediApiRestErrorTypeMastodonExtension on UnifediApiRestErrorType {
  MastodonApiRestErrorType toMastodonApiRestErrorType() =>
      _converter.convertTo(this);
}
