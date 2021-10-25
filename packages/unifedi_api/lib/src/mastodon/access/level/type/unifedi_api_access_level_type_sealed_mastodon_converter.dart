import 'package:mastodon_api/mastodon_api.dart';
import '../../../../api/access/level/type/unifedi_api_access_level_type_sealed.dart';

import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiAccessLevelTypeMastodonConverter();

class UnifediApiAccessLevelTypeMastodonConverter
    implements
        SealedConverter<UnifediApiAccessLevelType, MastodonApiAccessLevelType> {
  const UnifediApiAccessLevelTypeMastodonConverter();

  @override
  UnifediApiAccessLevelType convertFrom(
    MastodonApiAccessLevelType item,
  ) =>
      item.map(
        public: (_) => UnifediApiAccessLevelType.publicValue,
        application: (_) => UnifediApiAccessLevelType.applicationValue,
        user: (_) => UnifediApiAccessLevelType.userValue,
      );

  @override
  MastodonApiAccessLevelType convertTo(
    UnifediApiAccessLevelType item,
  ) =>
      item.map(
        public: (_) => MastodonApiAccessLevelType.publicValue,
        application: (_) => MastodonApiAccessLevelType.applicationValue,
        user: (_) => MastodonApiAccessLevelType.userValue,
      );
}

extension MastodonApiAccessLevelTypeUnifediExtension
    on MastodonApiAccessLevelType {
  UnifediApiAccessLevelType toUnifediApiAccessLevelType() =>
      _converter.convertFrom(this);
}

extension UnifediApiAccessLevelTypeMastodonExtension
    on UnifediApiAccessLevelType {
  MastodonApiAccessLevelType toMastodonApiAccessLevelType() =>
      _converter.convertTo(this);
}
