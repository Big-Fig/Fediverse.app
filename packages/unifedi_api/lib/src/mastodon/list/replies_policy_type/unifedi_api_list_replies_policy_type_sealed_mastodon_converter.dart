import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/list/replies_policy_type/unifedi_api_card_replies_policy_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiListRepliesPolicyTypeMastodonConverter();

class UnifediApiListRepliesPolicyTypeMastodonConverter
    implements
        SealedConverter<UnifediApiListRepliesPolicyType,
            MastodonApiListRepliesPolicyType> {
  const UnifediApiListRepliesPolicyTypeMastodonConverter();

  @override
  UnifediApiListRepliesPolicyType convertFrom(
    MastodonApiListRepliesPolicyType item,
  ) =>
      item.map(
        list: (_) => UnifediApiListRepliesPolicyType.listValue,
        followed: (_) => UnifediApiListRepliesPolicyType.followedValue,
        none: (_) => UnifediApiListRepliesPolicyType.noneValue,
        unknown: (value) => UnifediApiListRepliesPolicyType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiListRepliesPolicyType convertTo(
    UnifediApiListRepliesPolicyType item,
  ) =>
      item.map(
        list: (_) => MastodonApiListRepliesPolicyType.listValue,
        followed: (_) => MastodonApiListRepliesPolicyType.followedValue,
        none: (_) => MastodonApiListRepliesPolicyType.noneValue,
        unknown: (value) => MastodonApiListRepliesPolicyType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiListRepliesPolicyTypeUnifediExtension
    on MastodonApiListRepliesPolicyType {
  UnifediApiListRepliesPolicyType toUnifediApiListRepliesPolicyType() =>
      _converter.convertFrom(this);
}

extension UnifediApiListRepliesPolicyTypeMastodonExtension
    on UnifediApiListRepliesPolicyType {
  MastodonApiListRepliesPolicyType toMastodonApiListRepliesPolicyType() =>
      _converter.convertTo(this);
}
