import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/search/request_type/unifedi_api_search_request_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiSearchRequestTypeMastodonConverter();

class UnifediApiSearchRequestTypeMastodonConverter
    implements
        SealedConverter<UnifediApiSearchRequestType,
            MastodonApiSearchRequestType> {
  const UnifediApiSearchRequestTypeMastodonConverter();

  @override
  UnifediApiSearchRequestType convertFrom(
    MastodonApiSearchRequestType item,
  ) =>
      item.map(
        accounts: (_) => UnifediApiSearchRequestType.accountsValue,
        hashtags: (_) => UnifediApiSearchRequestType.hashtagsValue,
        statuses: (_) => UnifediApiSearchRequestType.statusesValue,
      );

  @override
  MastodonApiSearchRequestType convertTo(
    UnifediApiSearchRequestType item,
  ) =>
      item.map(
        accounts: (_) => MastodonApiSearchRequestType.accountsValue,
        hashtags: (_) => MastodonApiSearchRequestType.hashtagsValue,
        statuses: (_) => MastodonApiSearchRequestType.statusesValue,
      );
}

extension MastodonApiSearchRequestTypeUnifediExtension
    on MastodonApiSearchRequestType {
  UnifediApiSearchRequestType toUnifediApiSearchRequestType() =>
      _converter.convertFrom(this);
}

extension UnifediApiSearchRequestTypeMastodonExtension
    on UnifediApiSearchRequestType {
  MastodonApiSearchRequestType toMastodonApiSearchRequestType() =>
      _converter.convertTo(this);
}
