import 'package:mastodon_api/mastodon_api.dart';
import '../../../../api/media/attachment/type/unifedi_api_media_attachment_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiMediaAttachmentTypeMastodonConverter();

class UnifediApiMediaAttachmentTypeMastodonConverter
    implements
        SealedConverter<UnifediApiMediaAttachmentType,
            MastodonApiMediaAttachmentType> {
  const UnifediApiMediaAttachmentTypeMastodonConverter();

  @override
  UnifediApiMediaAttachmentType convertFrom(
    MastodonApiMediaAttachmentType item,
  ) =>
      item.map(
        image: (_) => UnifediApiMediaAttachmentType.imageValue,
        gifv: (_) => UnifediApiMediaAttachmentType.gifvValue,
        video: (_) => UnifediApiMediaAttachmentType.videoValue,
        audio: (_) => UnifediApiMediaAttachmentType.audioValue,
        unknown: (value) => UnifediApiMediaAttachmentType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiMediaAttachmentType convertTo(
    UnifediApiMediaAttachmentType item,
  ) =>
      item.map(
        image: (_) => MastodonApiMediaAttachmentType.imageValue,
        gifv: (_) => MastodonApiMediaAttachmentType.gifvValue,
        video: (_) => MastodonApiMediaAttachmentType.videoValue,
        audio: (_) => MastodonApiMediaAttachmentType.audioValue,
        unknown: (value) => MastodonApiMediaAttachmentType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiMediaAttachmentTypeUnifediExtension
    on MastodonApiMediaAttachmentType {
  UnifediApiMediaAttachmentType toUnifediApiMediaAttachmentType() =>
      _converter.convertFrom(this);
}

extension UnifediApiMediaAttachmentTypeMastodonExtension
    on UnifediApiMediaAttachmentType {
  MastodonApiMediaAttachmentType toMastodonApiMediaAttachmentType() =>
      _converter.convertTo(this);
}
