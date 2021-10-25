import 'package:mastodon_api/mastodon_api.dart';

import '../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../converter/sealed_converter.dart';

const _converter = UnifediApiVisibilityMastodonConverter();

class UnifediApiVisibilityMastodonConverter
    implements SealedConverter<UnifediApiVisibility, MastodonApiVisibility> {
  const UnifediApiVisibilityMastodonConverter();

  @override
  UnifediApiVisibility convertFrom(
    MastodonApiVisibility item,
  ) =>
      item.map(
        public: (_) => UnifediApiVisibility.publicValue,
        direct: (_) => UnifediApiVisibility.directValue,
        unlisted: (_) => UnifediApiVisibility.unlistedValue,
        private: (_) => UnifediApiVisibility.privateValue,
        unknown: (value) => UnifediApiVisibility.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiVisibility convertTo(
    UnifediApiVisibility item,
  ) =>
      item.map(
        public: (_) => MastodonApiVisibility.publicValue,
        direct: (_) => MastodonApiVisibility.directValue,
        // ignore: no-equal-arguments
        local: (value) => MastodonApiVisibility.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        list: (value) => MastodonApiVisibility.unknown(
          stringValue: value.stringValue,
        ),
        unlisted: (_) => MastodonApiVisibility.unlistedValue,
        private: (_) => MastodonApiVisibility.privateValue,
        // ignore: no-equal-arguments
        unknown: (value) => MastodonApiVisibility.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiVisibilityUnifediExtension on MastodonApiVisibility {
  UnifediApiVisibility toUnifediApiVisibility() => _converter.convertFrom(this);
}

extension UnifediApiVisibilityMastodonExtension on UnifediApiVisibility {
  MastodonApiVisibility toMastodonApiVisibility() => _converter.convertTo(this);
}

extension UnifediApiVisibilityMastodonListExtension
    on List<UnifediApiVisibility> {
  List<MastodonApiVisibility> toMastodonApiVisibilityList() => map(
        (item) => item.toMastodonApiVisibility(),
      ).toList();
}

extension MastodonApiVisibilityUnifediListExtension
    on List<MastodonApiVisibility> {
  List<UnifediApiVisibility> toMastodonApiVisibilityList() => map(
        (item) => item.toUnifediApiVisibility(),
      ).toList();
}
