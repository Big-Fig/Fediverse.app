import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/card/type/unifedi_api_card_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiCardTypeMastodonConverter();

class UnifediApiCardTypeMastodonConverter
    implements SealedConverter<UnifediApiCardType, MastodonApiCardType> {
  const UnifediApiCardTypeMastodonConverter();

  @override
  UnifediApiCardType convertFrom(
    MastodonApiCardType item,
  ) =>
      item.map(
        link: (_) => UnifediApiCardType.linkValue,
        photo: (_) => UnifediApiCardType.photoValue,
        video: (_) => UnifediApiCardType.videoValue,
        rich: (_) => UnifediApiCardType.richValue,
        unknown: (value) => UnifediApiCardType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiCardType convertTo(
    UnifediApiCardType item,
  ) =>
      item.map(
        link: (_) => MastodonApiCardType.linkValue,
        photo: (_) => MastodonApiCardType.photoValue,
        video: (_) => MastodonApiCardType.videoValue,
        rich: (_) => MastodonApiCardType.richValue,
        unknown: (value) => MastodonApiCardType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiCardTypeUnifediExtension on MastodonApiCardType {
  UnifediApiCardType toUnifediApiCardType() => _converter.convertFrom(this);
}

extension UnifediApiCardTypeMastodonExtension on UnifediApiCardType {
  MastodonApiCardType toMastodonApiCardType() => _converter.convertTo(this);
}
