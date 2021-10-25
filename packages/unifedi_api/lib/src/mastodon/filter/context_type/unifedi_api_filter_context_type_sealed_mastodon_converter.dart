import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/filter/context_type/unifedi_api_filter_context_type_model.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiFilterContextTypeMastodonConverter();

class UnifediApiFilterContextTypeMastodonConverter
    implements
        SealedConverter<UnifediApiFilterContextType,
            MastodonApiFilterContextType> {
  const UnifediApiFilterContextTypeMastodonConverter();

  @override
  UnifediApiFilterContextType convertFrom(
    MastodonApiFilterContextType item,
  ) =>
      item.map(
        home: (_) => UnifediApiFilterContextType.homeValue,
        notifications: (_) => UnifediApiFilterContextType.notificationsValue,
        public: (_) => UnifediApiFilterContextType.publicValue,
        thread: (_) => UnifediApiFilterContextType.threadValue,
        account: (_) => UnifediApiFilterContextType.accountValue,
        unknown: (value) => UnifediApiFilterContextType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiFilterContextType convertTo(
    UnifediApiFilterContextType item,
  ) =>
      item.map(
        home: (_) => MastodonApiFilterContextType.homeValue,
        notifications: (_) => MastodonApiFilterContextType.notificationsValue,
        public: (_) => MastodonApiFilterContextType.publicValue,
        thread: (_) => MastodonApiFilterContextType.threadValue,
        account: (_) => MastodonApiFilterContextType.accountValue,
        unknown: (value) => MastodonApiFilterContextType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiFilterContextTypeUnifediExtension
    on MastodonApiFilterContextType {
  UnifediApiFilterContextType toUnifediApiFilterContextType() =>
      _converter.convertFrom(this);
}

extension UnifediApiFilterContextTypeMastodonExtension
    on UnifediApiFilterContextType {
  MastodonApiFilterContextType toMastodonApiFilterContextType() =>
      _converter.convertTo(this);
}

extension UnifediApiFilterContextTypeMastodonListExtension
    on List<UnifediApiFilterContextType> {
  List<MastodonApiFilterContextType> toMastodonApiFilterContextTypeList() =>
      map(
        (e) => _converter.convertTo(e),
      ).toList();
}
